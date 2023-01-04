//
//  Repository.swift
//  ContactSwiftUI
//
//  Created by KC on 15/07/2022.
//

import Foundation
import Combine

class ContactRepo : ObservableObject {
    private init(){}
    
    static let shared = ContactRepo()
    
    
    @Published var contacts = [
        ContactVO(name: "Ma Ma", phoneNumbers: [
            PhoneNumberVO(number: "353495453499")
        ])
    ]
}
