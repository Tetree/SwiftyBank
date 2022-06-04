//
//  TransactionsAPI.swift
//  
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation
import Combine
import Models
import Networking

public protocol TransactionsAPI {
    
    func transactions(for name: String, and lastName: String) -> AnyPublisher<[Transaction], APIError>
    
}
