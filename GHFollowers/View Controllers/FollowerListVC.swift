//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Christopher Aronson on 1/13/20.
//  Copyright © 2020 Christopher Aronson. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
        guard let username = username else { return }
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, error in
            
            guard let followers = followers else {
                self.presentTAAlertOnMainThread(title: "Bad Stuff happened", message: error?.rawValue ?? "Unknow Error", buttonTitle: "Ok")
                return
            }
            
            print("Number of followers: \(followers.count)")
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
