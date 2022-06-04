//
//  File.swift
//  
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation
import Combine

public final class APIService: APIClient {
    
    public static let shared = APIService()
    
    public func request<T>(_ request: URLRequest) -> AnyPublisher<T, APIError> where T : Decodable {
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) in
                
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                      (200..<300).contains(statusCode) else {
                    throw APIError.failedRequest
                }
                
                do {
                    
                    return try JSONDecoder().decode(T.self, from: data)
                    
                }catch {
                    throw APIError.invalidResponse
                }
                
            }
            .mapError { error -> APIError in
                switch error {
                case let apiError as APIError:
                    return apiError
                case URLError.notConnectedToInternet:
                    return APIError.unreachable
                default:
                    return APIError.unreachable
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
}
