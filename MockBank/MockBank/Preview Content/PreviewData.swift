//
//  PreviewData.swift
//  MockBank
//
//  Created by Nuno Mota on 02/06/2022.
//

import Foundation

let transactionPreviewData = Transaction(id: 1, date: "02/06/2022", institution: "BNP", account: "Visa Electron", merchant: "Apple", amount: 300.2, type: "debit", categoryId: 675, category: "Wearables", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

let transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 20)
