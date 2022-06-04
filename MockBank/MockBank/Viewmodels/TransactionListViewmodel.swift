//
//  TransactionListViewmodel.swift
//  MockBank
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation
import Models

final class TranasactionListViewmodel: ObservableObject {
    
    @Published var transactions: [Transaction] = []
    
    
    
}
