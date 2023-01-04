//
//  Data.swift
//  ContactSwiftUI
//
//  Created by KC on 15/07/2022.
//

import Foundation

struct ContactVO {
    let id: String = UUID().uuidString
    var name: String
    let phoneNumbers:  [PhoneNumberVO]
    
}

struct PhoneNumberVO{
    let id : String = UUID().uuidString
    let number: String
}
