//
//  UserResponse.swift
//
//
//  Created by Erick Martin on 9/9/16.
//
//

import Foundation
import ObjectMapper

class UserResponse: Mappable {
    
    var id = 0
    var name = ""
    var imageUrl = ""
    var firstName = ""
    var email = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        imageUrl <- map["profile_picture"]
        firstName <- map["first_name"]
        email <- map["email"]
    }
    
    func toUser() -> User {
        let user = User()
        user.id = id
        user.name = name
        user.imageUrl = imageUrl
        user.firstName = firstName
        user.email = email
        return user
    }
    
}

class UserDataResponse: Mappable {
    
    var userResponse: UserResponse?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        userResponse <- map["user"]
    }
    
    func toUser() -> User? {
        if let userResponse = userResponse {
            return userResponse.toUser()
        }
        return nil
    }
    
}

