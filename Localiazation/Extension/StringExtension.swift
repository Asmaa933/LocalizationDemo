//
//  StringExtension.swift
//  Localiazation
//
//  Created by Asmaa Tarek on 25/08/2021.
//

import Foundation

extension String {
    var localized: String {
        guard let bundlePath = Bundle.main.path(forResource: LanguageManager.shared.getCurrentLanguage(), ofType: "lproj"),
              let bundle = Bundle(path: bundlePath) else {
            return NSLocalizedString(self, comment: "")
        }
        return NSLocalizedString(self, tableName: nil, bundle: bundle, comment: "")
     }
}
