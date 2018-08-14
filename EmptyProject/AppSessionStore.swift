//
//  AppSessionStore.swift
//
//
//  Created by Erick Martin on 9/7/16.
//
//

import Foundation

protocol AppSessionStore {
    func save(appSession: AppSession)
    func get() -> AppSession
    func clear()
}
