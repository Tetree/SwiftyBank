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

final class TransactionListViewmodel: ObservableObject {
    
    @Published private(set) var transactions: [Transaction] = []
    @Published private(set) var errorMessage: String?
    
    private let transactionsClient: TransactionsAPI
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(transactionsClient: TransactionsAPI) {
        self.transactionsClient = transactionsClient
        getTransactions()
    }
    
    
    func getTransactions() {
        transactionsClient
            .transactions(for: "randomName", and: "randomLastName")
            .sink { result in
                switch result {
                case .failure(let apiError):
                    break
                case .finished:
                    print("finished")
                }
            } receiveValue: { [weak self] transactionsArray in
                self?.transactions = transactionsArray
            }
            .store(in: &subscriptions)

    }
    
}
