//
//  FollowersCollectionViewCell.swift
//  GHFollowers
//
//  Created by Christopher Aronson on 1/16/20.
//  Copyright © 2020 Christopher Aronson. All rights reserved.
//

import UIKit

class FollowersCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCell"
    
    let padding: CGFloat = 8
    let avatarImage = TAAvatarImageView(frame: .zero)
    let usernameLabel = TATitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(follower: Follower) {
        
        usernameLabel.text = follower.login
    }
    
    private func configure() {
        
        addSubview(avatarImage)
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
