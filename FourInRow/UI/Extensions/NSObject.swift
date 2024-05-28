//
//  NSObject.swift
//  FourInRow
//
//  Created by Tatiana Ampilogova on 5/26/24.
//

import Foundation

extension NSObject {

    public var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last ?? ""
    }

    public static var className: String {
        return String(describing: self).components(separatedBy: ".").last ?? ""
    }
}
