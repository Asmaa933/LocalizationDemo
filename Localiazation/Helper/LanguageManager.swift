
//  Created by Asmaa Tarek  on 17/05/2021.
//

import UIKit

public enum Language: String {
    case arabic = "ar"
    case english = "en"
}

class LanguageManager {
    
    static let shared = LanguageManager()
    
    
    private(set) var bundle: Bundle
    
    private init() {
        bundle = .main
    }
    
    func getCurrentLanguage() -> String? {
        let langs = UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray
        
        return langs[0] as? String ?? "en"
    }
    
    func isArabicLanguage() -> Bool {
        guard let language = getCurrentLanguage() else {return false}
        return language == "ar"
    }
    
    @discardableResult
    func changeLanguage(language: String) -> Bool {
        var isChanged = false
        if (getCurrentLanguage() ?? "en") != language {
            UserDefaults.standard.setValue([language], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            setBundle(forLanaguageCode: language)
            changeSemanticContentAttribute()
            isChanged = true
        }
        return isChanged
    }
    
    func changeSemanticContentAttribute() {
        if isArabicLanguage() {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UIButton.appearance().semanticContentAttribute = .forceRightToLeft
            UITextView.appearance().semanticContentAttribute = .forceRightToLeft
            UITextField.appearance().semanticContentAttribute = .forceRightToLeft
            UITabBar.appearance().semanticContentAttribute = .forceRightToLeft
            UISearchBar.appearance().semanticContentAttribute = .forceRightToLeft
            UILabel.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UIButton.appearance().semanticContentAttribute = .forceLeftToRight
            UITextView.appearance().semanticContentAttribute = .forceLeftToRight
            UITextField.appearance().semanticContentAttribute = .forceLeftToRight
            UITabBar.appearance().semanticContentAttribute = .forceLeftToRight
            UISearchBar.appearance().semanticContentAttribute = .forceLeftToRight
            UILabel.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
    
    func localizedString(forKey key: String, value comment: String) -> String {
        let localized = bundle.localizedString(forKey: key, value: comment, table: nil)
        return localized
    }
    
    private func setBundle(forLanaguageCode code: String) {
        if let path = Bundle.main.path(forResource: code, ofType: "lproj") {
            bundle = Bundle(path: path) ?? .main
        } else {
            bundle = Bundle.main
        }
    }
}

