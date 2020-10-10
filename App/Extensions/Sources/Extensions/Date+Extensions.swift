//
//  Date+Extensions.swift
//  
//
//  Created by Skywinds on 10/10/20.
//

import Foundation

public extension Date {
   
    static var nextDate: Date {
        let today = Date().withoutTime
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: 1, to: today)!
    }
    
    var withoutTime: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: components)!
    }
    
    var nextDate: Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: 1, to: self.withoutTime)!
    }
    
}
