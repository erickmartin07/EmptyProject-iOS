//
//  ViewController.swift
//
//  Created by Erick Martin on 6/15/17.
//
//

import UIKit
import RxSwift
import KRProgressHUD

class MainViewController: UIViewController {
    
    var mainViewModel: MainViewModel!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        setupMainViewModel()
        mainViewModel.viewLoad()
    }
    
    private func setupMainViewModel() {


    }
}
