//
//  UIViewController+Extension.swift
//  GHFollowers
//
//  Created by Christopher Aronson on 1/14/20.
//  Copyright © 2020 Christopher Aronson. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentTAAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        
        DispatchQueue.main.async {
            
            let alertVC = TAAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
