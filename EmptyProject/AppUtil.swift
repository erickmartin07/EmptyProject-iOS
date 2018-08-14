//
//  AppUtil.swift
// 
//
//  Created by Erick Martin on 05/06/18.
//
//

import Foundation
import UIKit

class AppUtil {
    
    class func getAppDelegate() -> AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    
    class func getCurrentAppVersion() -> String {
        var currentAppVersion = ""
        
        if let versionNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            currentAppVersion = versionNumber
        }
        
        return currentAppVersion
    }
    
    class func getCurrentAppVersionWithBuildNumber() -> String {
        var currentAppVersion = AppUtil.getCurrentAppVersion()
        
        if let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            currentAppVersion = "\(currentAppVersion) (\(buildNumber))"
        }
        
        return currentAppVersion
    }
    
}
