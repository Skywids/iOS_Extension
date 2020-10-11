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
    
    func addPrefix(time: String) -> String {
        var timeWithPrefix = time
        if timeWithPrefix.lengthOfBytes(using: .utf8) == 1 {
            timeWithPrefix = "0" + time
        }
        return timeWithPrefix
    }
    
    func remainingTimeString(toDate: Date) -> String {
        let calendar = Calendar.current
        let diffDateComponents = calendar.dateComponents([.hour, .minute, .second], from: self, to: toDate)
        var countdownSTR = ""
        
        guard let hours = diffDateComponents.hour,
              let minutes = diffDateComponents.minute,
              let seconds = diffDateComponents.second else {
            return "00:00"
        }
        if hours >= 0 || minutes >= 0 || seconds >= 0 {
            let hourSTR = "\(String(describing: hours))"
            countdownSTR = addPrefix(time: hourSTR) + ":"
            let minSTR = "\(String(describing: minutes))"
            countdownSTR += addPrefix(time: minSTR) + ":"
            let secondSTR = "\(String(describing: seconds))"
            countdownSTR += addPrefix(time: secondSTR)
            return countdownSTR
        }
        return "00:00"
    }
}
