//
//  UserListViewModel.swift
//  Demoproject
//
//  Created by R, Rahul Pradev on 20/09/22.
//

import Foundation

protocol UserListDelegate: AnyObject {
    func didRefreshUserList(userList: UserListModel?, error: Error?)
}

class UserListViewModel {
    weak var delegate: UserListDelegate?
    
    func getUserList(pageNo: Int) {
        var urlStr = ServerURL.url + APIPathConstants.listUsers
        urlStr = String(format: urlStr, pageNo)
       
        DispatchQueue.global(qos: .background).async {
            APIManager.shared().apiRequest(urlRequest: URLRequest(url: URL(string: urlStr)!), type: UserListModel.self, withCompletion: { result in
                
                switch result {
                case .success(let response):
                    self.delegate?.didRefreshUserList(userList: response, error: nil)
                case .failure(let error):
                    self.delegate?.didRefreshUserList(userList: nil, error: error)
                    
                }
            })
        }
    }
}
