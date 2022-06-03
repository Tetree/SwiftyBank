//
//  DateFormatter.swift
//  MockBank
//
//  Created by Nuno Mota on 03/06/2022.
//

import Foundation

extension DateFormatter {
    
    static let allNumericDate:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/mm/yyyy"
        return formatter
    }()
    
}
