//
//  HabitDetailTableViewHeader.swift
//  HabitTracker
//
//  Created by Егор Лазарев on 06.03.2022.
//

import UIKit

class HabitDetailTableViewHeader: UITableViewHeaderFooterView {
    
    static let identifire = "HabitDetailTableViewHeader"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .systemGray2
        label.text = "Активность"
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
