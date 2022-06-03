//
//  String.swift
//  MockBank
//
//  Created by Nuno Mota on 03/06/2022.
//

import Foundation


extension String {
    
    func dateParse() -> Date {
        return DateFormatter.allNumericDate.date(from: self) ?? Date()
    }
    
}
