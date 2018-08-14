//
//  AppSessionUserDefaultsStore.swift
//
//
//  Created by Erick Martin on 9/7/16.
//. Al`   l rights reserved.
//

import Foundation

class AppSessionUserDefaultsStore: AppSessionStore {

    private let defaults = UserDefaults.standard
    private let tokenSessionKey = "tokenSessionKey"
    private let userIdSessionKey = "userIdSessionKey"
    
    func save(appSession: AppSession) {
        defaults.setValue(appSession.token, forKey: tokenSessionKey)
        defaults.setValue(appSession.userId, forKey: userIdSessionKey)
        
    }
    
    func get() -> AppSession {
        let appSession = AppSession()
        appSession.token = defaults.string(forKey: tokenSessionKey) ?? ""
        appSession.userId = defaults.integer(forKey: userIdSessionKey)
        return appSession
    }
    
    func clear() {
        defaults.removeObject(forKey: tokenSessionKey)
        defaults.removeObject(forKey: userIdSessionKey)
    }
}
