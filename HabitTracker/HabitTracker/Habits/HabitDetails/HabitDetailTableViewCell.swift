//
//  HabitDetailTableViewCell.swift
//  HabitTracker
//
//  Created by Егор Лазарев on 06.03.2022.
//

import UIKit

class HabitDetailTableViewCell: UITableViewCell {
    
    static let identifire = "HabitDetailTableViewCell"
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var checker: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = Const.purpurColor
        label.text = "✔︎"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews(dateLabel, checker)
        useConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func useConstraint() {
        NSLayoutConstraint.activate([dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.indent),
                                     dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
                                     dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Const.indent),
                                     checker.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.indent),
                                     checker.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: Const.leadingMargin),
                                     checker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin)
                                    ])
    }
    
    func setup(date: Date, check: Bool) {
        
        let today = Calendar.current.dateComponents([.day], from: Date())
        let activDay = Calendar.current.dateComponents([.day], from: date)
        
        if let day = today.day {
            if day == activDay.day {
                dateLabel.text = "Сегодня"
            } else if day - 1 == activDay.day {
                dateLabel.text = "Вчера"
            } else if day - 2 == activDay.day {
                dateLabel.text = "Позавчера"
            } else {
                let dateformat = DateFormatter()
                dateformat.locale = Locale(identifier: "ru_RU")
                dateformat.dateFormat = "dd MMMM yyyy"
                dateLabel.text = dateformat.string(from: date)
            }
        } else {
            dateLabel.text = "Не удалось определить день события"
        }
        checker.isHidden = !check
    }
    
}
