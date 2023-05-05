//
//  CustomFilterCollectionViewCell.swift
//  sw895_p5
//
//  Created by Sophia Wang on 3/27/23.
//

import UIKit

class CustomFilterCollectionViewCell: UICollectionViewCell {
    var label = UILabel()
    var filterSelected: Bool = false
    let lightPink = UIColor(red: 1.0, green: 0.75, blue: 0.8, alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
//        if !filterSelected {
//            label.backgroundColor = .systemRed
//        } else {
//            label.backgroundColor = .systemTeal
//        }
        contentView.addSubview(label)
        
        setupConstraints()
    }
    
    func configure(filterName: String) {
        label.text = filterName
        changeColor()
    }
    
    func changeColor() {
        print("attempting to change color")
        print(filterSelected)
        if (filterSelected) {
            label.backgroundColor = lightPink
        } else {
            label.backgroundColor = lightPink
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
