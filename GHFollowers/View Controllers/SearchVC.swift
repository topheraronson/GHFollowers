//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Christopher Aronson on 1/13/20.
//  Copyright © 2020 Christopher Aronson. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    let logoImageView = UIImageView()
    let searchUsernameTextField = TATextField()
    let searchButton = TAButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool { return !(searchUsernameTextField.text?.isEmpty ?? false) }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureLogoImageView()
        configureSearchUsernameTextField()
        configureSearchButton()
        
        createDismissTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func configureLogoImageView() {
        
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureSearchUsernameTextField() {
        
        view.addSubview(searchUsernameTextField)
        searchUsernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            searchUsernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            searchUsernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchUsernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchUsernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureSearchButton() {
        
        view.addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func createDismissTapGesture() {
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func pushFollowerListVC() {
     
        guard isUsernameEntered else {
            
            presentTAAlertOnMainThread(title: "Empty Username", message: "Please Enter a username so we can search for it.", buttonTitle: "Ok")
            return
        }
        
        let followerVC = FollowerListVC()
        followerVC.username = searchUsernameTextField.text
        followerVC.title = searchUsernameTextField.text
        
        navigationController?.pushViewController(followerVC, animated: true)
    }
}

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        pushFollowerListVC()
        return true
    }
}
