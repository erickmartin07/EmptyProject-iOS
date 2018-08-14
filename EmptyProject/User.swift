//
//  User.swift
//
//
//  Created by Erick Martin on 9/8/16.
//
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var email: String = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}
