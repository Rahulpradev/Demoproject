//
//  UserListModel.swift
//  Demoproject
//
//  Created by R, Rahul Pradev on 20/09/22.
//

import Foundation

struct UserListModel: Decodable {
    var page: Int
    var per_page: Int
    var total: Int
    var total_pages: Int
    //var data: [UserModel]
}

struct UserListReponseModel: Decodable {
    var data: UserListModel
    //[UserModel]
}

struct UserModel: Decodable {
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String
}
