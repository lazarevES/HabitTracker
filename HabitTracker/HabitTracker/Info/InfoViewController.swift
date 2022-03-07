//
//  InfoViewController.swift
//  HabitTracker
//
//  Created by Егор Лазарев on 03.03.2022.
//

//Мне больше нравится держать информацию в табличке, но если не устаривает, то могу переделать на scroll view

import UIKit

class InfoViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped )
        table.toAutoLayout()
        table.refreshControl = UIRefreshControl()
        table.backgroundColor = .white
        table.isScrollEnabled = true
        table.separatorInset = .zero
        table.rowHeight = UITableView.automaticDimension
        table.refreshControl?.addTarget(self, action: #selector(updateTable), for: .valueChanged)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Информация"
        
        view.addSubview(tableView)
        
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(InfoViewHeader.self, forHeaderFooterViewReuseIdentifier: InfoViewHeader.identifire)
        tableView.register(InfoViewCell.self, forCellReuseIdentifier: InfoViewCell.identifire)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
    @objc func updateTable() {
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }
    
}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoViewCell.identifire, for: indexPath) as? InfoViewCell else { return UITableViewCell() }
        cell.setup(text: infoTextArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        infoTextArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: InfoViewHeader.identifire) as? InfoViewHeader else { return nil }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
        
    }
    
}
