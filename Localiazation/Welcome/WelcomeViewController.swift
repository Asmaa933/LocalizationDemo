//
//  WelcomeViewController.swift
//  Localiazation
//
//  Created by Asmaa Tarek on 24/08/2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "welcome".localized
    }

    @IBAction func changeLanguage(_ sender: UIButton) {
        let language = LanguageManager.shared.isArabicLanguage() ? "en" : "ar"
        if   LanguageManager.shared.changeLanguage(language: language) {
            reloadApp()
        }
    }
    
    func reloadApp() {
        let transitionOption: UIView.AnimationOptions =  LanguageManager.shared.isArabicLanguage() ?  .transitionFlipFromRight : .transitionFlipFromLeft
        
        if #available(iOS 13.0, *) {
            guard let window = UIApplication.shared.keyWindowInConnectedScenes else {return}
            window.rootViewController = WelcomeViewController()
            UIView.transition(with: window, duration: 0.6, options: transitionOption, animations: {})
            
        } else  {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            appDelegate.window?.rootViewController = WelcomeViewController()
            UIView.transition(with: appDelegate.window!, duration: 0.6, options: transitionOption, animations: {})
        }
    }


}
