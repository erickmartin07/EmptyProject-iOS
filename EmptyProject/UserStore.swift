//
//  UserStore.swift
//
//
//  Created by Erick Martin on 9/8/16.
//
//

import Foundation

protocol UserStore {
    func save(user: User)
    func get(id: Int) -> User?
}
