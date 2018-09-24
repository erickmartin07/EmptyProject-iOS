//
//  UILabel+Util.swift
//
//
//  Created by Erick Martin on 8/3/17.
//
//

import Foundation
import UIKit

extension UILabel {
    
    func addTextSpacing(scape: Float) {
        guard let textString = text, textString.length > 0 else { return }
        let attributedString = NSMutableAttributedString(string: textString)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: scape, range: NSRange(location: 0, length: attributedString.length - 1))
        attributedText = attributedString
    }
    
    func addLineSpacing(space: CGFloat) {
        guard let textString = text, textString.length > 0 else { return }
        let attributedString = NSMutableAttributedString(string: textString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = space
        paragraphStyle.alignment = .center
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        attributedText = attributedString;
    }
    
}
