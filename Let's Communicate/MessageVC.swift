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
        view.backgroundColor = .white
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 30    
    
        
    }
    private func layout(){
        

        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            
        ])
    }
}

//MARK: Table View
extension MessageVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)).cgColor
        cell.selectionStyle = .none

        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    

        
}
