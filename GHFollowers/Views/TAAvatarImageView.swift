//
//  TAAvatarImageView.swift
//  GHFollowers
//
//  Created by Christopher Aronson on 1/16/20.
//  Copyright © 2020 Christopher Aronson. All rights reserved.
//

import UIKit

class TAAvatarImageView: UIImageView {

    let placeHolerImage = UIImage(named: "avatar-placeholder")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolerImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
