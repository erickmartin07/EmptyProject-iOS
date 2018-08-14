//
//  MainViewModel.swift
//
//  Created by Erick Martin on 6/15/17.
//
//

import Foundation
import RxSwift

class MainViewModel {
    
    private let useProduction = false
    
    var rxEventShowHideLoadingIndicator: Observable<Bool> {
        return eventShowHideLoadingIndicator
    }
    
    var rxEventShowConnectionProblemAlert: PublishSubject<Void> {
        return eventShowConnectionProblemAlert
    }
    
    private let eventShowHideLoadingIndicator = PublishSubject<Bool>()
    private let eventShowConnectionProblemAlert = PublishSubject<Void>()
    
    private let manageSession: ManageSessionProtocol
    private let disposeBag = DisposeBag()
    
    init(manageSession: ManageSessionProtocol) {
        self.manageSession = manageSession
    }
    
    func viewLoad() {
        loadFirstScreen()
    }
    
    func loadFirstScreen() {

    }
}
