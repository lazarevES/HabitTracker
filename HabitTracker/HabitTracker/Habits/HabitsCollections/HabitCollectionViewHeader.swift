//
//  HabitCollectionViewHeader.swift
//  HabitTracker
//
//  Created by Егор Лазарев on 12.03.2022.
//

import UIKit

class HabitCollectionViewHeader: UICollectionReusableView {
    
    static let identifire = "HabitCollectionViewHeader"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.text = "Сегодня"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(label)
        useConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func useConstraint() {
        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: topAnchor, constant: Const.indent),
                                     label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.leadingMargin),
                                     label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Const.downIndent)])
    }
    
    
}
