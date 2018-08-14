//
//  UserViewParam.swift
//
//
//  Created by Erick Martin on 9/8/16.
//
//

import Foundation

class UserViewParam {
    
    var id = 0
    var name = ""
    var imageUrl = ""
    var firstName = ""
    var email = ""
    
    func toUser() -> User {
        let user = User()
        user.id = id
        user.name = name
        user.imageUrl = imageUrl
        user.firstName = firstName
        user.email = email
        return user
    }
    
    static func create(_ user: User) -> UserViewParam {
        let userViewParam = UserViewParam()
        userViewParam.id = user.id
        userViewParam.name = user.name
        userViewParam.imageUrl = user.imageUrl
        userViewParam.firstName = user.firstName
        userViewParam.email = user.email
        return userViewParam
    }
    
}
