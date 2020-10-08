//
//  String+App.swift
//  Extensions
//
//  Created by Mac on 08/10/20.
//

import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
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
