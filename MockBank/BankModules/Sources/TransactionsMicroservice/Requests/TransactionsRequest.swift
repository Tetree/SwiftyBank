//
//  File.swift
//  
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation

struct TransactionRequest: Codable {
    let token:String
    let data: TransactionsRequestBody
}

struct TransactionsRequestBody: Codable {
    let id: String
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: String
    let type: String
    var categoryId: String
    var category: String
    var isPending: String
    var isTransfer: String
    var isExpense: String
    var isEdited: String
}