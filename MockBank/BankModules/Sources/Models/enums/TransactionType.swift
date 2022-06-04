//
//  TransactionType.swift
//  MockBank
//
//  Created by Nuno Mota on 02/06/2022.
//

import Foundation

public enum TransactionType: String, Decodable {
    case debit = "debit"
    case credit = "credit"
}
