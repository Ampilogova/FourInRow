//
//  FieldItemCell.swift
//  FourInRow
//
//  Created by Tatiana Ampilogova on 5/26/24.
//

import UIKit

class FieldItemCell: UICollectionViewCell {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        label.textAlignment = .center
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(_ item: FieldItem) {
        if item.id == 1 {
            label.backgroundColor = .red
        } else if item.id == 2 {
            label.backgroundColor = .blue
        } else {
            label.backgroundColor = .systemGray5
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




