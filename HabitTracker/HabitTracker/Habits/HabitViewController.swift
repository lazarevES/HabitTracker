//
//  HabitViewController.swift
//  HabitTracker
//
//  Created by Егор Лазарев on 03.03.2022.
//

import UIKit

class HabitViewController: UIViewController {

    var habit: Habit?
    
    var habitColor: UIColor = Const.standartColor {
        didSet {
            nameTextField.textColor = habitColor
            dateValue.textColor = habitColor
            colorButton.backgroundColor = habitColor
        }
    }
    
    var date: Date = Date() {
        didSet {
            let dateformat = DateFormatter()
            dateformat.dateFormat = "HH:mm a"
            dateValue.text = dateformat.string(from: date)
        }
    }
    
    var habitName: String = ""
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.toAutoLayout()
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Название"
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.toAutoLayout()
        textField.backgroundColor = .white
        textField.leftViewMode = .always
        textField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.textColor = habitColor
        textField.addTarget(self, action: #selector(nameTextChanged), for: .editingChanged)
        textField.autocapitalizationType = .none
        textField.returnKeyType = .done
        textField.delegate = self
        return textField
    }()
    
    lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.text = "Цвет"
        return label
    }()
    
    lazy var colorButton: UIButton = {
        let colorButton = UIButton()
        colorButton.toAutoLayout()
        colorButton.backgroundColor = habitColor
        colorButton.layer.cornerRadius = Const.circleSize / 2
        colorButton.isUserInteractionEnabled = true
        colorButton.addTarget(self, action: #selector(tapToColorButton), for: .touchUpInside)
        return colorButton
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Время"
        return label
    }()
    
    lazy var dateText: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Каждый день в "
        return label
    }()
    
    lazy var dateValue: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = habitColor
        label.numberOfLines = 1
        let dateformat = DateFormatter()
        dateformat.dateFormat = "HH:mm a"
        label.text = dateformat.string(from: date)
        return label
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.toAutoLayout()
        datePicker.date = date
        datePicker.backgroundColor = .white.withAlphaComponent(0.9)
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.tintColor = Const.purpurColor
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        return datePicker
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.backgroundColor = .white
        button.setTitle("Удалить привычку", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.addTarget(self, action: #selector(deleteHabit), for: .touchUpInside)
        return button
    }()
    
    init(_ editHabit: Habit?) {
        
        super.init(nibName: nil, bundle: nil)
        
        habit = editHabit
        if let habitSource = habit {
            date = habitSource.date
            habitColor = habitSource.color
            habitName = habitSource.name
            nameTextField.text = habitName
            deleteButton.isHidden = false
        } else {
            deleteButton.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Создать"
        view.backgroundColor = .white
        
        let leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain , target: self, action: #selector(cancelHabit))
        leftBarButtonItem.tintColor = Const.purpurColor
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain , target: self, action: #selector(saveHabit))
        rightBarButtonItem.tintColor = Const.purpurColor
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        view.addSubviews(nameLabel, nameTextField, colorLabel, colorButton, dateLabel, dateText, dateValue, datePicker, deleteButton)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        view.addGestureRecognizer(tapGesture)
        
        useConstraint()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func useConstraint() {
        
        [nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Const.titleIndent),
         nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Const.leadingMargin),
         nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Const.trailingMargin),
         nameLabel.heightAnchor.constraint(equalToConstant: nameLabel.font.pointSize),
         
         nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Const.indent),
         nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Const.leadingMargin),
         nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Const.trailingMargin),
         
         colorLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: Const.indent),
         colorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Const.leadingMargin),
         colorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Const.trailingMargin),
        
         colorButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: Const.indent),
         colorButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Const.leadingMargin),
         colorButton.heightAnchor.constraint(equalToConstant: Const.circleSize),
         colorButton.widthAnchor.constraint(equalToConstant: Const.circleSize),
         
         dateLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: Const.indent),
         dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Const.leadingMargin),
         dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Const.trailingMargin),
         
         dateText.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Const.indent),
         dateText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Const.leadingMargin),
         
         dateValue.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Const.indent),
         dateValue.leadingAnchor.constraint(equalTo: dateText.trailingAnchor, constant: Const.leadingMargin),
         
         datePicker.topAnchor.constraint(equalTo: dateText.bottomAnchor, constant: Const.indent),
         datePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Const.leadingMargin),
         datePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Const.leadingMargin),
         
         deleteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Const.downIndent),
         deleteButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
         
        ].forEach({$0.isActive = true})
        
    }
    
    @objc func cancelHabit() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveHabit() {
        
        //Обнулим секунды
        let calendar = Calendar.current
        let second = calendar.component(.second, from: date)
        date = date.addingTimeInterval(Double(second) * (-1.0))
        
        if let selfHabit = habit {
          
            selfHabit.name = habitName
            selfHabit.date = date
            selfHabit.color = habitColor
            HabitsStore.shared.save()
            
            HabitsViewController.collectionView.reloadData()
            
        } else {
            
            let newHabit = Habit(name: habitName,
                                 date: date,
                                 color: habitColor)
            let store = HabitsStore.shared
            
            if !store.habits.contains(newHabit) {
                store.habits.append(newHabit)
                HabitsViewController.collectionView.reloadData()
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc func deleteHabit() {
        
        let alertController = UIAlertController(title: "Удалить привычку", message: "Вы хотите удалить привычку \"\(habitName)\"?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { (action) -> Void in
            if let selfHabit = self.habit {
                HabitsStore.shared.habits.removeAll(where: {$0 == selfHabit})
                HabitsViewController.collectionView.reloadData()
            }
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @objc func tapOnView() {
        nameTextField.resignFirstResponder()
    }
    
    @objc func nameTextChanged() {
        if let text = nameTextField.text {
            habitName = text
        }
    }
    
    @objc func dateChanged( _ sender: UIDatePicker) {
        date = sender.date
    }
    
    @objc func tapToColorButton() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.selectedColor = habitColor
        colorPicker.delegate = self
        navigationController?.present(colorPicker, animated: true, completion: nil)
    }

}

extension HabitViewController: UIColorPickerViewControllerDelegate, UITextFieldDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        habitColor = viewController.selectedColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true;
    }
}

