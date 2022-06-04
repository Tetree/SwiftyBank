//
//  APIClient.swift
//  
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation
import Combine

public protocol APIClient {
    
    func request<T:Decodable>(_ request: URLRequest) -> AnyPublisher<T, APIError>
    
}
