//
//  String+Extension.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 31/10/24.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predictor = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predictor.evaluate(with: self)
    }
    
    var isValidPasswrod: Bool {
        let regEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        let predictor = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predictor.evaluate(with: self)
    }
}
