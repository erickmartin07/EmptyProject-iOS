//
//NavigationController.swift
//
//
//  Created by Erick Martin on 9/13/16.
//
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    var shouldBack: Bool = false
    
    override func viewDidLoad() {
        setupAppearance()
        setupNavigationBarFont()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let lastViewController = viewControllers.last else { return .portrait }
        
        return lastViewController.supportedInterfaceOrientations
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
    
    private func setupNavigationBarFont() {
        let newFont = UIFont(name: "Lato-Bold", size: 14)!
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: newFont]
    }

    private func setupAppearance() {
        let newFont = UIFont(name: "Lato-Bold", size: 16)!
        navigationBar.backIndicatorImage = UIImage(named: "btnBack")
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "btnBack")
        navigationBar.barTintColor = UIColor.white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: newFont, NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}
