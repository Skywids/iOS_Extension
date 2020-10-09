//
//  String+App.swift
//  Extensions
//
//  Created by Skywinds on 08/10/20.
//

import Foundation

public extension String {

    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var isNumeric : Bool {
        return NumberFormatter().number(from: self) != nil
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var toSeconds: Int {
        let components: Array = self.components(separatedBy: ":")
        if components.count > 0 {
            let hours = Int(components[0])
            let minutes = Int(components[1])
            var seconds = Int(components[2])
            seconds = seconds! + (minutes! * 60)
            seconds = seconds! + (hours! * 60 * 60)
            return seconds!
        }
        return 0
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
