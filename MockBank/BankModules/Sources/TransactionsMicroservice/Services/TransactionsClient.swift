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
    
    public init() {}
    
    private let apiClient: APIClient = APIService.shared
    
    public func transactions(for name: String, and lastName: String) -> AnyPublisher<[Transaction], APIError> {
        
        var request = URLRequest(url: Constants.transactionsEndpoint)
        request.httpMethod = "post"
        
        let body = TransactionsRequestBody(id: "bankCCNumber", date: "date", institution: "bankCCName", account: "bankCCNumber", merchant: "companyName", amount: "numberInt", type: "personNickname", categoryId: "numberInt", category: "companyDepartment", isPending: "numberBool", isTransfer: "numberBool", isExpense: "numberBool", isEdited: "numberBool", repeats: 20)
        
        let requestBody = TransactionRequest(token: Constants.apiKey, data: body)
        
        let bodyData = try! JSONEncoder().encode(requestBody)
        
        request.httpBody = bodyData
        
        return apiClient.request(request)
    }
}
