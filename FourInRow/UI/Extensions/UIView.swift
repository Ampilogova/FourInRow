//
//  UIView.swift
//  FourInRow
//
//  Created by Tatiana Ampilogova on 5/26/24.
//

import UIKit

extension UIView {
    
    public func makeRounded() {
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
}
