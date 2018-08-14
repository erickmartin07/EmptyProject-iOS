//
//  UIImageView+Util.swift
//  Gojek-ContactsApp
//
//  Created by Erick Martin on 8/14/18.
//  Copyright © 2018 SweetEscape. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func loadUrl(_ urlString: String, placeholderImage: UIImage = PlaceholderImage.get(), completion: (() -> Void)? = nil) {
        guard let url = URL(string: urlString) else { return }
        
        kf.setImage(with: url, placeholder: placeholderImage, options: [.transition(.fade(0.5))]) { _, error, _, _ -> Void in
            guard let completion = completion , error == nil else { return }
            completion()
        }
    }
}

class PlaceholderImage {
    
    static var image: UIImage?
    
    class func get() -> UIImage {
        guard image == nil else { return image! }
        
        let color = UIColor(netHex: 0xE6E6E6)
        let size = CGSize(width: 1, height: 1)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}
