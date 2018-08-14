//
//  AuthResponse.swift
//
//
//  Created by Erick Martin on 9/9/16.
//
//

import Foundation
import ObjectMapper

class AuthResponse: Mappable {
    var user: UserResponse?
    var token = ""
    var status = ApiResultStatusResponse()
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        user <- map["user"]
        token <- map["token"]
        status.message <- map["message"]
    }
    
    func toAuth() -> Auth {
        let auth = Auth()
        auth.token = token
        auth.user = user?.toUser()
        auth.apiResultStatus = status.toApiResultStatus()
        return auth
    }
    
}
