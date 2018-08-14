//
//  LoginApiService.swift
//
//
//  Created by Erick Martin on 9/7/16.
//
//

import Foundation
import RxSwift
import ObjectMapper

class AuthApiService: AuthApi {
    
    let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func login(username: String, password: String) -> Observable<Auth> {
        let headers = ["":""]
        let params = ["email": username, "password": password]
        return apiClient.postString(path: "login",
                                               headers: headers,
                                               params: params)
            .map { (success, jsonString) in
                let auth = Mapper<AuthResponse>().map(JSONString: jsonString)?.toAuth() ?? Auth()
                auth.apiResultStatus.success = success
                return auth
        }
    }
    
    func logout(token: String, deviceId: String) -> Observable<Void> {
        let headers = ["User-Access-Token": token]
        let params = ["device_id": deviceId]
        
        return apiClient.postString(path: "logout",
            headers: headers,
            params: params)
            .map { _  in }
    }
    
}
