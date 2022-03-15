//
//  ProgressCollectionViewCells.swift
//  HabitTracker
//
//  Created by Егор Лазарев on 05.03.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
   
    static let identifire = "ProgressCollectionViewCell"
    
    lazy var motivationLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Все получится!"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.backgroundColor = .white
        label.textColor = .systemGray2
        label.numberOfLines = 1
        return label
    }()
    
    lazy var procentLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.backgroundColor = .white
        label.textColor = .systemGray2
        label.numberOfLines = 1
        return label
    }()
    
    lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .bar )
        progressBar.toAutoLayout()
        progressBar.trackTintColor = .systemGray2
        progressBar.progressTintColor = Const.purpurColor
        progressBar.backgroundColor = .white
        progressBar.layer.cornerRadius = 8
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = Const.smallIndent/3
        progressBar.subviews[1].clipsToBounds = true
        return progressBar
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = Const.smallCornerRadius
        contentView.addSubviews(motivationLabel, procentLabel, progressBar)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        progressBar.progress = HabitsStore.shared.todayProgress
        procentLabel.text = String(Int(HabitsStore.shared.todayProgress * 100)) + "%"
        useConstraint()
    }
    
    func useConstraint() {
        [motivationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.indent),
         motivationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
         procentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.indent),
         procentLabel.leadingAnchor.constraint(equalTo: motivationLabel.trailingAnchor, constant: Const.leadingMargin),
         procentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin),
         progressBar.topAnchor.constraint(equalTo: motivationLabel.bottomAnchor, constant: Const.smallIndent),
         progressBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
         progressBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin),
         progressBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Const.indent),
         progressBar.heightAnchor.constraint(equalToConstant: Const.smallIndent * 0.5)
        ].forEach({$0.isActive = true})
    }
    
}

