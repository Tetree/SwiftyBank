//
//  TransactionsClient.swift
//  
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation
import Networking
import Combine
import Models

public final class TransactionsClient: TransactionsAPI {
    
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func transactions(_ request: URLRequest) -> AnyPublisher<[Transaction], APIError> {
        return apiClient.request(request)
    }
}
