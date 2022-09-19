//
//  ViewController.swift
//  Demoproject
//
//  Created by R, Rahul Pradev on 18/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    var targetValue: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.addTarget(self, action: #selector(changebg), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }

    @objc func changebg(){
        self.loginBtn.backgroundColor = .black
    }
    func check(guess: Int) {
        targetValue += guess
    }

}

