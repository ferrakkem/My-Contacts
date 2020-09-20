//
//  ContactModel.swift
//  My Contacts
//
//  Created by Ferrakkem Bhuiyan on 2020-09-16.
//  Copyright © 2020 Ferrakkem Bhuiyan. All rights reserved.
//

import Foundation
import RealmSwift

class ContactModel: Object {
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var company: String?
    @objc dynamic var number: String?
    @objc dynamic var email: String?
    @objc dynamic var imageData: NSData?
}
