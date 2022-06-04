//
//  PreviewData.swift
//  MockBank
//
//  Created by Nuno Mota on 02/06/2022.
//

import Foundation
import Models
import TransactionsMicroservice
import Combine
import Networking

let transactionPreviewData = Transaction(id: 1, date: "02/06/2022", institution: "BNP", account: "Visa Electron", merchant: "Apple", amount: 300.2, isCredit: true, categoryId: 675, category: "Wearables", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

let transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 20)

final class PreviewTransactionApi : TransactionsAPI {
    
    func transactions(for name: String, and lastName: String) -> AnyPublisher<[Transaction], APIError> {
        return CurrentValueSubject<[Transaction], APIError>(transactionListPreviewData).eraseToAnyPublisher()
    }

}
