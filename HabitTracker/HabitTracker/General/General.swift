//
//  General.swift
//  HabitTracker
//
//  Created by Егор Лазарев on 03.03.2022.
//

import UIKit

struct Const {
    static var cornerRadius: CGFloat = 16
    static var smallCornerRadius: CGFloat = 8
    static var bigCornerRadius: CGFloat = 19
    
    static var titleIndent: CGFloat = 21
    static var indent: CGFloat = 16
    static var downIndent: CGFloat = -16
    static var smallIndent: CGFloat = 8
    
    static var height: CGFloat = 60
    static var bigHeight: CGFloat = 130
    
    static var leadingMargin: CGFloat = 16
    static var bigLeadingMargin: CGFloat = 25
    static var overBigLeadingMargin: CGFloat = 40
    
    static var trailingMargin: CGFloat = -16
    static var bigTrailingMargin: CGFloat = -25
    static var overBigTrailingMargin: CGFloat = -40
    
    static var circleSize: CGFloat = 30
    static var bigCircleSize: CGFloat = 38
    
    static var purpurColor = UIColor(red: 161/255, green: 22/255, blue: 204/255, alpha: 1)
    static var foneColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
    static var standartColor = UIColor(red: 41/255, green: 109/255, blue: 255/255, alpha: 1)
}

extension UIView {
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

var infoTextArray: [String] = ["Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:",
                               "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага.",
                               "2. Выдержать 2 дня в прежнем состоянии самоконтроля.",
                               "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться.",
                               "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.",
                               "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой.",
                               "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."]



