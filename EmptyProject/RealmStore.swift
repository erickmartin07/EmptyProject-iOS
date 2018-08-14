//
//  RealmStore.swift
//
//
//  Created by Erick Martin on 9/8/16.
//
//

import Foundation
import RealmSwift

class RealmStore {
 
    static let dbVersion: UInt64 = 69
    var realm: Realm
   
    init(inMemoryId: String? = nil) {
        if let inMemoryId = inMemoryId {
            realm = try! Realm(configuration:
                Realm.Configuration(inMemoryIdentifier: inMemoryId))
        } else {
            RealmStore.initializeRealm()
            realm = try! Realm()
        }
    }
    
    class func initializeRealm() {
        let config = Realm.Configuration(
            schemaVersion: RealmStore.dbVersion,
            
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < RealmStore.dbVersion) {
                    //auto upgrade
                }
        })
        
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
    }
}

