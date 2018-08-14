//
//  LoginApi.swift
//
//
//  Created by Erick Martin on 9/7/16.
//
//

import Foundation
import RxSwift

protocol AuthApi {
    func login(username: String, password: String) -> Observable<Auth>
    func logout(token: String, deviceId: String) -> Observable<Void>
}
