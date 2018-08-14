//
//  UserRealmStore.swift
//
//
//  Created by Erick Martin on 9/8/16.
//
//

import Foundation
import RealmSwift

class UserRealmStore: RealmStore, UserStore {
 
    func save(user: User) {
        try! realm.write {
            realm.add(user, update: true)
        }
    }
    
    func get(id: Int) -> User? {
        return realm.objects(User.self).filter("id = \(id)").first
    }
    
}
