//
//  SignUpViewController.swift
//  My_Note_App
//
//  Created by Yashom on 20/09/24.
//

import UIKit

class NotesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private let table:UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "todo"
        view.addSubview(table)
        table.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
  
    
    
}
