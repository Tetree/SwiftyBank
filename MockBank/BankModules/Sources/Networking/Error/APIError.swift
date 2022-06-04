//
//  File.swift
//  
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation

public enum APIError: Error {
    case unknown
    case failedRequest
    case invalidResponse
    case unreachable
}
