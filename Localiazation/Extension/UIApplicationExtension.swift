//
//  UIApplicationExtension.swift
//  Localiazation
//
//  Created by Asmaa Tarek on 25/08/2021.
//

import UIKit

extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }
}
