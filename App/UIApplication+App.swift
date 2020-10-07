//
//  UIApplication+App.swift
//  Extensions
//
//  Created by Skywinds on 08/09/20
//

import UIKit

extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
}
