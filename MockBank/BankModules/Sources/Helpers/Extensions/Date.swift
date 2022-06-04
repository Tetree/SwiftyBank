//
//  Date.swift
//  
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation

extension Date: Strideable {
    
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
    
}
