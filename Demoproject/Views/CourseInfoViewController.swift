//
//  CourseInfoViewController.swift
//  Demoproject
//
//  Created by R, Rahul Pradev on 20/09/22.
//

import UIKit

class CourseInfoViewController: UIViewController {
    
    @IBOutlet weak var usersTableView: UITableView!
    
    private let userListCellIdentifier = "CourseListTableViewCell"
    
    var courselistVM: UserListViewModel?
    
    var usersList: [UserModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courselistVM = UserListViewModel()
        self.usersTableView.dataSource = self
        self.usersTableView.register(UINib(nibName: userListCellIdentifier, bundle: nil), forCellReuseIdentifier: userListCellIdentifier)
        self.usersTableView.rowHeight = 80
        
        loadUsersList()
    }
    
    func loadUsersList() {
        courselistVM?.delegate = self
        courselistVM?.getUserList(pageNo: 2)
    }
}

//MARK: UserList delegate methods
extension CourseInfoViewController: UserListDelegate {
    func didRefreshUserList(userList: UserListModel?, error: Error?) {
        DispatchQueue.main.async {
            self.usersList = userList?.data
            self.usersTableView.reloadData()
        }
    }
}


//MARK: TableView delegate methods
extension CourseInfoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.usersList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CourseListTableViewCell", for: indexPath) as? CourseListTableViewCell {
            cell.model = usersList?[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
