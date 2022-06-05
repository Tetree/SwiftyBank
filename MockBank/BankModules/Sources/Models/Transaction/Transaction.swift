//
//  Transaction.swift
//  MockBank
//
//  Created by Nuno Mota on 02/06/2022.
//

import Foundation
import Helpers

public struct Transaction : Identifiable, Decodable, Hashable {

    public let account: String
    public let amount: Int
    public let category: String
    public let categoryID: Int
    public let date, id, institution: String
    public let isCredit, isEdited, isExpense, isPending: Bool
    public let isTransfer: Bool
    public let merchant: String

    enum CodingKeys: String, CodingKey {
        case account, amount, category
        case categoryID = "categoryId"
        case date, id, institution, isCredit, isEdited, isExpense, isPending, isTransfer, merchant
    }
    
    public var parsedDate:Date { date.dateParse() }
    
    public var signedAmount: Int { isCredit ? amount : -amount }
    
    public var month:String { parsedDate.formatted(.dateTime.year().month(.wide)) }
    
    public init(id: String, date: String, institution: String, account: String, merchant: String, amount: Int, isCredit: Bool, categoryId: Int, category: String, isPending: Bool, isTransfer: Bool, isExpense: Bool, isEdited: Bool) {
        self.id = id
        self.date = date
        self.institution = institution
        self.account = account
        self.merchant = merchant
        self.amount = amount
        self.isCredit = isCredit
        self.categoryID = categoryId
        self.category = category
        self.isPending = isPending
        self.isTransfer = isTransfer
        self.isExpense = isExpense
        self.isEdited = isEdited
    }
    
}
