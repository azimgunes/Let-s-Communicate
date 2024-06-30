//  Let's Communicate
//
//  Created by Azim Güneş on 12.05.2024.
//

import UIKit


private let reuseId = "MessageID"

protocol IndexVcProtocol: AnyObject{
    func showMessageVc(_ indexVC: ChatsVC, user: User)
}

class ChatsVC: UIViewController {
    
    //MARK: Proporties
    weak var delegate: IndexVcProtocol?
    private let tableView = UITableView()
    private var lastUsers = [lastUser]()
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLastUsers()
        style()
        layout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchLastUsers()
    }
    
}


//MARK: Helpers

extension ChatsVC{
    private func style(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(IndexCell.self, forCellReuseIdentifier: reuseId)
        tableView.backgroundColor = .clear
        
    }
    
    private func layout(){
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
        ])
    }
}

//MARK: TableView Delegate/Data Source

extension ChatsVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lastUsers.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: [indexPath.row]) as! IndexCell
        cell.lastUser = lastUsers[indexPath.row]
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 15
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.showMessageVc(self, user: lastUsers[indexPath.row].user)
    }
    
    private func fetchLastUsers(){
        Service.fetchLastUser { lastUsers in
            self.lastUsers = lastUsers
            self.tableView.reloadData()
        }
    }
}

