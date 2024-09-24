//
//  SignUpViewController.swift
//  My_Note_App
//
//  Created by Yashom on 20/09/24.
//
/*
import UIKit

class SignUpViewController: UIViewController {
    
    let email : UITextField = {
        let email = UITextField()
        email.placeholder = "email"
        email.autocapitalizationType = .none
        return email
    }()
    
    let password : UITextField = {
        let email = UITextField()
        email.placeholder = "password"
        email.autocapitalizationType = .none
        return email
    }()
    
    private let button: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Sign Up", for: .normal)
       
        return button
    }()
    
    private let label: UILabel = {
        
         let label = UILabel()
        label.textAlignment = .center
        label.text = "Hi"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    //*****************************

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(button)
        view.addSubview(label)
        button.addTarget(self, action: #selector(onTapsignUp), for: .touchUpInside)
        viewDidLayoutSubviews()
    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: 0,
                             y: 100,
                             width: view.frame.size.width,
                             height: 80)
        
        email.frame = CGRect(x: 20,
                                  y: label.frame.origin.y+label.frame.size.height+10,
                                  width: view.frame.size.width-40,
                                  height: 50)
        
        password.frame = CGRect(x: 20,
                                     y: email.frame.origin.y+email.frame.size.height+10,
                                     width: view.frame.size.width-40,
                                     height: 50)
        
        button.frame = CGRect(x: 20,
                              y: password.frame.origin.y+password.frame.size.height+10,
                              width: view.frame.size.width-40,
                              height: 50)
    }
    
    @objc func onTapsignUp(){
        guard let email = email.text, let pass = password.text, !email.isEmpty, !pass.isEmpty else{
            label.text = "fil email or password"
            print("error")
            return
        }
        presenter.addData(email: email, password: pass)
        label.text = "You are Signed up"
        print("sign in succesfull")
    }

}
*/
