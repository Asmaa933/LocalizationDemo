//
//  StringExtension.swift
//  Localiazation
//
//  Created by Asmaa Tarek on 25/08/2021.
//

import Foundation

extension String {
    var localized: String {
        return LanguageManager.shared.localizedString(forKey: self, value: "")
     }
}
