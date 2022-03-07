//
//  InfoViewCell.swift
//  HabitTracker
//
//  Created by Егор Лазарев on 08.03.2022.
//

import UIKit

class InfoViewCell: UITableViewCell {
    
    static let identifire = "InfoViewCell"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews(label)
        useConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func useConstraint() {
        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.indent),
                                     label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
                                     label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Const.indent),
                                     label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin)
                                    ])
    }
    
    func setup(text: String) {
        label.text = text
    }
    
}
