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
protocol messageVCProtocol: AnyObject {
    func toChatVC(user: User)
}

class IndexVC: UIViewController {
    
    
    
    //MARK: Properties
    
    weak var delegate: messageVCProtocol?
    private let tableView = UITableView()
    private var users = [User]()
    
    //MARK: Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        style()
        layout()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Service.fetchData { users in
            self.users = users
            self.tableView.reloadData()
        }
    }
}


//MARK: Extensions

extension IndexVC{
    private func style(){
        
        configureGradient()

        //Table View
        tableView.delegate =  self
        tableView.dataSource = self
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 80
        tableView.separatorStyle = .singleLine
        tableView.separatorColor =  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        
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
extension IndexVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! UserCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        cell.user = users[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.toChatVC(user: users[indexPath.row])
    }
    
    
    
}
