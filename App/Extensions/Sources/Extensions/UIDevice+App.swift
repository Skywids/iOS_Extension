//
//  UIDevice+App.swift
//  Extensions
//
//  Created by Skywinds on 08/09/20
//

import UIKit

public extension UIDevice {
    
    class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    var hasNotch: Bool {
        // Need UIApplication+App.swift
        if #available(iOS 11.0, *) {
            let bottom = UIApplication.keyWindow?.safeAreaInsets.bottom ?? 0
            return bottom > 0
        } else {
            return false
        }
    }
}

