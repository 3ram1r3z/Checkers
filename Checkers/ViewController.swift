//
//  ViewController.swift
//  Checkers
//
//  Created by Emmanuel Ramirez on 6/21/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

extension UIColor {
    static var lightBrown = UIColor(red: 160/255, green: 124/255, blue: 90/255, alpha: 1)
}

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .lightBrown
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: String(describing: CustomCell.self))
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomCell.self), for: indexPath)
        cell.backgroundColor = whichTileColor(section: indexPath.section, row: indexPath.row)
        return cell
    }
    
    func whichTileColor(section: Int, row: Int) -> UIColor {
        if section % 2 == 0 {
            if row % 2 == 0 {
                return .black
            } else {
                return .white
            }
        } else {
            if row % 2 == 0 {
                return .white
            } else {
                return.black
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8 //////
    }
    
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

class CustomCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Custom testing text"
//        label.adjustsFontSizeToFitWidth = true
//        label.backgroundColor = .white
        return label
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        backgroundColor = .red
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
