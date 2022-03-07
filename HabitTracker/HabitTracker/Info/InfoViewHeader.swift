//
//  InfoViewHeader.swift
//  HabitTracker
//
//  Created by Егор Лазарев on 08.03.2022.
//

import UIKit

class InfoViewHeader: UITableViewHeaderFooterView {
    
    static let identifire = "InfoViewHeader"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.text = "Привычка за 21 день"
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        useConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func useConstraint() {
        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.indent),
                                     label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin)])
    }
    
}
