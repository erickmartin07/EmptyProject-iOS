//
//  Login.swift
//
//
//  Created by Erick Martin on 9/7/16.
//
//

import Foundation
import RxSwift

protocol ManageSessionProtocol {
    var isLoggedIn: Bool { get }
    
    func login(username: String, password: String) -> Observable<ApiResultStatusViewParam>
    func getUser() -> UserViewParam?
    func logout()
}

class ManageSession: ManageSessionProtocol {
    
    private let authApi: AuthApi
    private var appSessionStore: AppSessionStore
    private var userStore: UserStore
    
    init(authApi: AuthApi, appSessionStore: AppSessionStore, userStore: UserStore) {
        self.authApi = authApi
        self.appSessionStore = appSessionStore
        self.userStore = userStore
    }
    
    var isLoggedIn: Bool {
        return appSessionStore.get().isLoggedIn
    }
    
    func login(username: String, password: String) -> Observable<ApiResultStatusViewParam> {
    
        return authApi.login(username: username, password: password).map { [weak self] auth in
                guard let weakSelf = self else { return ApiResultStatusViewParam() }
                let appSession = AppSession()
                if let token = auth.token, let user = auth.user {
                    appSession.token = token
                    appSession.userId = user.id
                    weakSelf.appSessionStore.save(appSession: appSession)
                    
                    if let user = auth.user {
                        weakSelf.userStore.save(user: user)
                    }
                }
                return ApiResultStatusViewParam.create(apiResultStatus: auth.apiResultStatus)
        }
    }
    
    func getUser() -> UserViewParam? {
        guard isLoggedIn else { return nil }
        
        let userId = appSessionStore.get().userId
        let user = userStore.get(id: userId)
        
        return UserViewParam.create(user!)
    }
    
    func logout() {
        let token = appSessionStore.get().token
        appSessionStore.clear()
    
        _ = authApi.logout(token: token, deviceId:"").subscribe(onNext: {})
    }
}
