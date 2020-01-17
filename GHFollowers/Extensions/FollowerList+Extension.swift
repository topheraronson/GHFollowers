//
//  FollowerList+Extension.swift
//  GHFollowers
//
//  Created by Christopher Aronson on 1/14/20.
//  Copyright © 2020 Christopher Aronson. All rights reserved.
//

import Foundation

extension FollowerListVC: TAAlertVCDelegate {
    
    func dismissCurrentVC() {
        navigationController?.popToRootViewController(animated: true)
    }
}
