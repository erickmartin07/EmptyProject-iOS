//
//  AppSession.swift
//
//
//  Created by Erick Martin on 9/7/16.
//
//

import Foundation

class AppSession {
    
    var token = ""
    var userId = 0
    
    var isLoggedIn: Bool {
        get {
            return !token.isEmpty
        }
    }
}
