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
            APIManager.shared().load(urlRequest: URLRequest(url: URL(string: urlStr)!), type: UserListReponseModel.self, withCompletion: { result, error in
                if result != nil {
                    //self.delegate?.didRefreshUserList(userList: result, error: nil)
                } else {
                    self.delegate?.didRefreshUserList(userList: nil, error: error)
                }
                print("result \(result)")
                
                print("error \(error)")
            })
        }
    }
}
