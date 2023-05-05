//
//  CollectionViewCell.swift
//  sw895_p5
//
//  Created by Sophia Wang on 3/27/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let mealTypeLabel = UILabel()
    let prepTimeLabel = UILabel()
    let lightPink = UIColor(red: 1.0, green: 0.75, blue: 0.8, alpha: 1.0)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = .white
        nameLabel.textColor = .darkGray
        contentView.addSubview(nameLabel)
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        mealTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mealTypeLabel)
        
        prepTimeLabel.translatesAutoresizingMaskIntoConstraints
        contentView.addSubview(prepTimeLabel)

        setUpConstraints()
    }
    
    func setUpConstraints() {
        let padding: CGFloat = 12.0
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -padding),
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            mealTypeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            mealTypeLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            mealTypeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            prepTimeLabel.topAnchor.constraint(equalTo: mealTypeLabel.bottomAnchor, constant: padding),
            prepTimeLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            prepTimeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
        
//        NSLayoutConstraint.activate([
//            stepsLabel.topAnchor.constraint(equalTo: prepTimeLabel.bottomAnchor, constant: padding),
//            stepsLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//            stepsLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//        ])
    }
    
    func update(imgName: String, name: String, description: String, ingredients: String, cuisine: String, mealtype: String, preptime: String, steps: String){
        
        if (UIImage(named: imgName) == nil) {
            imageView.image = UIImage(named: "default")
        } else {
            imageView.image = UIImage(named: imgName)
        }
        
        nameLabel.text = name
        mealTypeLabel.text = mealtype
        prepTimeLabel.text = preptime
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//fix text views in createnewviewcontroller -- bc of textViews
//creates new boxes but doesn't show the information: shouldn't be
//default, shoudl be the name of the recipe
//detail view controller isn't implemented
//filtering??
