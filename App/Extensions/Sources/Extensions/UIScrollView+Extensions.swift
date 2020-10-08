//
//  UIScrollView.swift
//  Extensions
//
//  Created by Skywinds on 10/8/20.
//

import Foundation
import UIKit

extension UIScrollView {

    func setContentInsetAndScrollIndicatorInsets(_ edgeInsets: UIEdgeInsets) {
        self.contentInset = edgeInsets
        self.scrollIndicatorInsets = edgeInsets
    }
    
}
