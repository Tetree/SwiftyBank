//
//  Transaction.swift
//  MockBank
//
//  Created by Nuno Mota on 02/06/2022.
//

import Foundation
import Helpers

public struct Transaction : Identifiable, Decodable, Hashable {

    public let id: Int
    public let date: String
    public let institution: String
    public let account: String
    public let merchant: String
    public let amount: Double
    public let type: TransactionType.RawValue
    public var categoryId: Int
    public var category: String
    public var isPending: Bool
    public var isTransfer: Bool
    public var isExpense: Bool
    public var isEdited: Bool
    
    public var parsedDate:Date { date.dateParse() }
    
    public var signedAmount: Double { type == TransactionType.credit.rawValue ? amount : -amount }
    
    public init(id: Int, date: String, institution: String, account: String, merchant: String, amount: Double, type: TransactionType.RawValue, categoryId: Int, category: String, isPending: Bool, isTransfer: Bool, isExpense: Bool, isEdited: Bool) {
        self.id = id
        self.date = date
        self.institution = institution
        self.account = account
        self.merchant = merchant
        self.amount = amount
        self.type = type
        self.categoryId = categoryId
        self.category = category
        self.isPending = isPending
        self.isTransfer = isTransfer
        self.isExpense = isExpense
        self.isEdited = isEdited
    }
    
}
