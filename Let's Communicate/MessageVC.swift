//
//  MessageVC.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 12.05.2024.
//

import UIKit
import Firebase
import FirebaseAuth

private let reuseId = "userCell"

class MessageVC: UIViewController {
    
    //MARK: Properties
    private let tableView = UITableView()
    
    
    //MARK: Lifecycle
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        style()
        layout()
    
    }
}


//MARK: Extensions

extension MessageVC{
    private func style(){
        //Table View
        tableView.delegate =  self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseId)
        tableView.rowHeight = 75
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 30
        
    }
    private func layout(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}

//MARK: Table View
extension MessageVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 15
        cell.layer.borderColor = UIColor.clear.cgColor
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
}
