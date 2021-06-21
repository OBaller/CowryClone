//
//  Extensions.swift
//  CowryWiseReplica
//
//  Created by Decagon on 11/05/2021.
//

import Foundation
extension String{
        public var isValidEmail: Bool {
            NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
        }
    
    
}
    extension String{
    public var isValidPassword: Bool {
            NSPredicate(format: "SELF MATCHES %@","^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$").evaluate(with: self)
        }
}
