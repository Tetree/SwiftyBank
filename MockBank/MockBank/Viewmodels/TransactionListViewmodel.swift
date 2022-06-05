//
//  TransactionListViewmodel.swift
//  MockBank
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation
import Models
import TransactionsMicroservice
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String, Double)]

final class TransactionListViewmodel: ObservableObject {
    
    @Published private(set) var state: ResultState = .loading
    private(set) var transactions: [Transaction] = []
    
    private let transactionsClient: TransactionsAPI
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(transactionsClient: TransactionsAPI) {
        self.transactionsClient = transactionsClient
    }
    
    
    func getTransactions() {
        state = .loading
        transactionsClient
            .transactions(for: "randomName", and: "randomLastName")
            .sink { [weak self] result in
                switch result {
                case .failure(let apiError):
                    var message = ""
                    switch apiError {
                    case .unreachable:
                        message = "No internet connection"
                    case .failedRequest:
                        message = "Server is down.\n Please try again later"
                    default:
                        message = "Something went wrong.\nPlease try again later"
                    }
                    self?.state = .failure(message)
                case .finished:
                    print("finished")
                    self?.state = .success
                }
            } receiveValue: { [weak self] transactionsArray in
                self?.transactions = transactionsArray
                self?.state = .success
            }
            .store(in: &subscriptions)

    }
    
    func groupTransactionByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else { return [:] }
        
        return TransactionGroup(grouping: transactions) {  $0.month }
    }
    
    func accumulateTransactionsForCurrentMonth() -> TransactionPrefixSum {
        guard !transactions.isEmpty else { return [] }
        
        let today = Date()
        
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        
        var sum:Int = .zero
        var cumulativeSum = TransactionPrefixSum()
        
        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
            
            let dailyExpenses = transactions.filter { $0.parsedDate == date && $0.isExpense }
            let dailyTotalExpenses = dailyExpenses.reduce(0) { $0 - $1.signedAmount }
            
            sum += dailyTotalExpenses
            cumulativeSum.append((date.formatted(), Double(sum)))
        }
        
        return cumulativeSum
    }
}
