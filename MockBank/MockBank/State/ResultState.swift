//
//  ResultState.swift
//  MockBank
//
//  Created by Nuno Mota on 05/06/2022.
//

import Foundation
import Models

enum ResultState {
    case loading
    case success
    case failure(String)
}
