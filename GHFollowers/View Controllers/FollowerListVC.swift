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
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVC()
        configureCollectionView()
        getFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureVC() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    
    private func configureCollectionView() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowersCollectionViewCell.self, forCellWithReuseIdentifier: FollowersCollectionViewCell.reuseID)
    }
    
    private func getFollowers() {
        
        guard let username = username else { return }
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            
            switch result {
            
                case .success(let followers):
                    print(followers)
                
                case .failure(let error):
                    self.presentTAAlertOnMainThread(title: "Bad Stuff happened", message: error.rawValue, buttonTitle: "Ok", delegate: self)
            }
        }
    }
    
    private func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        
        let width = view.bounds.width
        let padding: CGFloat = 12.0
        let minimumItemSpacing: CGFloat = 10.0
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
