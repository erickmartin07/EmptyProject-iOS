//
//  String+Util.swift
//
//
//  Created by Erick Martin on 9/18/16.
//
//

import Foundation
import UIKit

extension String {
    
    var length: Int {
        return self.count
    }
    
    var isNumber : Bool {
        get{
            return !self.isEmpty && self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
        }
    }
    
    mutating func convertFromyyyyMMddToDate() -> Date {
        if self.length == 10 {
            self = "\(self)T00:00:00.000Z"
        }
        let dateFormatter = DateFormatter()
        let usLocale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.locale = usLocale
        return dateFormatter.date(from: self)!
    }
    
    func toSessionFormat() -> String {
        return self.replacingOccurrences(of: ".00", with: "")
    }
    
    func trim() -> String {
        return self.trimmingCharacters(
            in: CharacterSet.whitespacesAndNewlines
        )
    }
    
    func trunc(length: Int, trailing: String = "…") -> String {
        return (self.count > length) ? self.prefix(length-1) + trailing : self
    }
    
    func parseToDeeplinkWithPath(path: String) -> String? {
        let texts = components(separatedBy: "/")
        var targetIndex = -1
        
        for (index, text) in texts.enumerated() {
            if text == path && (index+1) < texts.count {
                targetIndex = index + 1
            }
        }

        if targetIndex >= 0 && targetIndex < texts.count {
            return texts[targetIndex]
        }
        
        return nil
    }
    
    func toPhoneNumberFormat() -> String {
        let stringArray = self.components(
            separatedBy: CharacterSet.decimalDigits.inverted)
        let newString = stringArray.joined(separator: "")
        
        return "+\(newString)"
    }
    
    func getFirstAndLastName() -> (firstName: String, lastName: String?) {
        var nameWords = self.components(separatedBy: CharacterSet.whitespaces)
            .filter { $0.length > 0 }
        
        nameWords = nameWords.map {
            $0.trim()
        }
        
        let firstName = nameWords.first ?? ""
        var lastName: String?
        
        if nameWords.count > 1 {
            lastName = nameWords[1...nameWords.count - 1].joined(separator: " ")
        }
        
        return (firstName: firstName, lastName: lastName)
    }
    
    func getFirstWord() -> String {
        return self.components(separatedBy: CharacterSet.whitespaces).first ?? ""
    }
    
    func stringWithLineSpacing(font: UIFont, lineSpace: CGFloat) -> NSAttributedString{
        let attributedString = NSMutableAttributedString(string: self)
        let paragraphAttribute = NSMutableParagraphStyle()
        paragraphAttribute.lineSpacing = lineSpace
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphAttribute, range: NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(NSAttributedStringKey.font, value: font, range: NSMakeRange(0, attributedString.length))
        return attributedString
    }
    
    func getYoutubeId() -> String? {
        return URLComponents(string: self)?.queryItems?.first(where: { $0.name == "v" })?.value
    }
    
    init(htmlEncodedString: String) {
        self.init()
        guard let encodedData = htmlEncodedString.data(using: .utf8) else {
            self = htmlEncodedString
            return
        }
        
        let attributedOptions: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
            NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        do {
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            self = attributedString.string
        } catch {
            print("Error: \(error)")
            self = htmlEncodedString
        }
    }
}

