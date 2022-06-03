//
//  Transaction.swift
//  MockBank
//
//  Created by Nuno Mota on 02/06/2022.
//

import Foundation

struct Transaction : Identifiable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    var isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var parsedDate:Date { date.dateParse() }
    
    var signedAmount: Double { type == TransactionType.credit.rawValue ? amount : -amount }
}
