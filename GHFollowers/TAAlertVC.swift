//
//  TAAlertVC.swift
//  GHFollowers
//
//  Created by Christopher Aronson on 1/14/20.
//  Copyright © 2020 Christopher Aronson. All rights reserved.
//

import UIKit

class TAAlertVC: UIViewController {

    let containerView = UIView()
    let titleLabel = TATitleLabel(textAlignment: .center, fontSize: 20)
    let bodyMessageLabel = TABodyLabel(textAlignment: .center)
    let actionButton = TAButton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureBodyMessageLabel()
    }
    
    private func configureContainerView() {
        
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    private func configureTitleLabel() {
        
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Error"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    private func configureActionButton() {
        
        containerView.addSubview(actionButton)
        actionButton.setTitle(title ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureBodyMessageLabel() {
        
        containerView.addSubview(bodyMessageLabel)
        bodyMessageLabel.text = message ?? "Unable to complete request."
        bodyMessageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            bodyMessageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            bodyMessageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            bodyMessageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            bodyMessageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}
