//
//  SwinjectStoryboard+Setup.swift
//
//  Created by Erick Martin on 6/15/17.
//
//

import Foundation
import SwinjectStoryboard
import Swinject

extension SwinjectStoryboard {
    
    static let useProductionServer = true
    
    @objc class func setup() {
        Container.loggingFunction = nil
        
        registerStoryboards()
        registerViewModels()
        registerInteractors()
        registerStorages()
        registerApis()

    }
    
    class func resolveDefault<Service>(_ service: Service.Type) -> Service? {
        return SwinjectStoryboard.defaultContainer.resolve(service)
    }
    
    private class func registerStoryboards() {
        defaultContainer.storyboardInitCompleted(MainViewController.self) { r, c in
            c.mainViewModel = r.resolve(MainViewModel.self)!
        }
    }
    
    private class func registerViewModels() {
        defaultContainer.register(MainViewModel.self) { r in
            MainViewModel(manageSession: r.resolve(ManageSessionProtocol.self)!)
        }
        
        defaultContainer.register(AppScreenViewModel.self) { r in
            AppScreenViewModel()
        }
    }
    
    private class func registerInteractors() {
        defaultContainer.register(ManageSessionProtocol.self) { r in
            ManageSession(authApi: r.resolve(AuthApi.self)!,
                          appSessionStore: r.resolve(AppSessionStore.self)!,
                          userStore: r.resolve(UserStore.self)!)
        }
    }
    
    private class func registerApis() {
        defaultContainer.register(ApiClientProtocol.self) { r in
            ApiClient(useProduction: useProductionServer)
        }
        
        defaultContainer.register(AuthApi.self) { r in
            AuthApiService(apiClient: r.resolve(ApiClientProtocol.self)!)
        }
    }
    
    private class func registerStorages() {
        
        defaultContainer.register(AppSessionStore.self) { r in
            AppSessionUserDefaultsStore()
        }
        
        defaultContainer.register(UserStore.self) { r in
            UserRealmStore()
        }
    }
}
