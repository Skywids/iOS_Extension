//
//  UIDevice+App.swift
//  Extensions
//
//  Created by Skywinds on 08/09/20
//

import UIKit

extension UIDevice {
    public class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    var hasNotch: Bool {
        // Need UIApplication+App.swift
        let bottom = UIApplication.keywindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}

