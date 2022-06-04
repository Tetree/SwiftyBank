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

protocol TransactionsAPI {
    
    func transactions(_ request: URLRequest) -> AnyPublisher<[Transaction], APIError>
    
}
