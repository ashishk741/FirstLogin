//
//  ViewController.swift
//  FirstLogin
//
//  Created by ashish on 02/10/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnSubmit:UIButton!
    @IBOutlet weak var lbl_name:UITextField!
    let apiService = APIService()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnSubmit.addTarget(self, action: #selector(Click_move), for: .touchUpInside)
        
        apiService.fetchUsers { users in
            if let users = users {
                DispatchQueue.main.async {
                    print("Users:", users)
                    // You can now update your UI with `users`
                }
            }
        }
    }
   

    @objc func Click_move(){
        
        view.backgroundColor = UIColor.gray
    }

}
