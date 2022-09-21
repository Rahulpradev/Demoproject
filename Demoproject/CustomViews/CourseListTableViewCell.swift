//
//  TableViewCell.swift
//  Demoproject
//
//  Created by R, Rahul Pradev on 20/09/22.
//

import UIKit

class CourseListTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var NameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    var model: UserModel? {
        didSet {
            setCellProperties()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setCellProperties() {
        self.NameLbl.text = (model?.first_name ?? "") + " " + (model?.last_name ?? "")
        self.emailLbl.text = model?.email
        //load images async and put in avatar
    }
    
}
