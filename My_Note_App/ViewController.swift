//
//  ViewController.swift
//  LoginFirebase
//
//  Created by Yashom on 16/09/24.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let presenter: Presenter = Presenter.initializer()
    
    private let label: UILabel = {
        
         let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let emailField: UITextField = {
        
        let emailField = UITextField()
        emailField.placeholder = "Enter email address"
        emailField.autocapitalizationType = .none
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.black.cgColor
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return emailField
    }()
    
    
    private let passwordField: UITextField = {
        
        let passField = UITextField()
        passField.placeholder = "Enter password"
        passField.layer.borderWidth = 1
        passField.isSecureTextEntry = true
        passField.layer.borderColor = UIColor.black.cgColor
        passField.leftViewMode = .always
        passField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return passField
    }()
    
   
    
    private let button: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        return button
    }()

    

// 88
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
        
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
       
        
    }
    
  
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: 0,
                             y: 100,
                             width: view.frame.size.width,
                             height: 80)
        
        emailField.frame = CGRect(x: 20,
                                  y: label.frame.origin.y+label.frame.size.height+10,
                                  width: view.frame.size.width-40,
                                  height: 50)
        
        passwordField.frame = CGRect(x: 20,
                                     y: emailField.frame.origin.y+emailField.frame.size.height+10,
                                     width: view.frame.size.width-40,
                                     height: 50)
        
        button.frame = CGRect(x: 20,
                              y: passwordField.frame.origin.y+passwordField.frame.size.height+10,
                              width: view.frame.size.width-40,
                              height: 50)
    }
    
   /* override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if FirebaseAuth.Auth.auth().currentUser == nil{
            emailField.becomeFirstResponder()
        }
       
    }*/
    
    @objc private func didTapButton(){
        print("Continue button tapped")
       // presenter.addData(email: "ankan", password: "1234")
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else{
            print("Missing field data")
            return
        }
        
        if presenter.search(a: email, b: password){
            guard let vc = storyboard?.instantiateViewController(withIdentifier:"notes") as? NotesViewController else{
                return
            }
            //vc.id = email
            navigationController?.pushViewController(vc, animated: true)
            
            print("loged in")
        }
        else{
            showCreateAccount()
        }
      /*  Firebase.Auth.auth().signIn(withEmail: email, password: password, completion: {  result, error in
           
            guard error == nil else{
                //show account creation
                return
            }
            
            self.transition1()
            print("You have signed-in")
        })*/
        
    }
    
    func showCreateAccount(){
        
        let alert = UIAlertController(title: "You Don't Have An Account",
                                      message: "Would you like to create an account",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue",
                                      style: .default,
                                      handler: { _ in
            self.transition1()
            
        }
                                     ))
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: { _ in
           
            
        }))
        
        present(alert, animated: true)
        
    }
    
    func transition1() {
       guard let homeViewController = storyboard?.instantiateViewController(withIdentifier: "signUp") as? SignUpViewController
        else{
           return
       }
        navigationController?.pushViewController(homeViewController, animated: true)
        homeViewController.navigationItem.largeTitleDisplayMode = .never
        print("transition")
        
    }



}
