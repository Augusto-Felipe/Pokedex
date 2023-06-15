//
//  HomeScreen.swift
//  NavViewPersonalizada
//
//  Created by Felipe Augusto Correia on 28/03/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var navView: NavView = {
        let view = NavView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pokeball")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var collectionview: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .appBackGround
        cv.delaysContentTouches = false
        cv.showsVerticalScrollIndicator = false
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 25, bottom: 0, right: 25)
        layout.minimumInteritemSpacing = 10
        cv.setCollectionViewLayout(layout, animated: true)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .appBackGround
        self.addElements()
        self.configConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(self.navView)
        self.navView.addSubview(self.backgroundImage)
        self.addSubview(self.collectionview)
    }
    
    public func configCollectionViewDelegate(delegate: UICollectionViewDelegate, datasource: UICollectionViewDataSource) {
        collectionview.delegate = delegate
        collectionview.dataSource = datasource
        collectionview.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
    }
    
    private func configConstrains() {
        NSLayoutConstraint.activate([
            self.navView.topAnchor.constraint(equalTo: self.topAnchor),
            self.navView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navView.heightAnchor.constraint(equalToConstant: 220),
            
            self.collectionview.topAnchor.constraint(equalTo: self.navView.bottomAnchor, constant: 10),
            self.collectionview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            self.backgroundImage.heightAnchor.constraint(equalToConstant: 80),
            self.backgroundImage.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
}
