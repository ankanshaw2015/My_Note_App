//
//  CompleteViewController.swift
//  My_Note_App
//
//  Created by Yashom on 22/09/24.
//

import UIKit

class CompleteViewController: UIViewController,UITableViewDataSource{

        
    private let label: UILabel = {
        
         let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
        private let table:UITableView = {
           let table = UITableView()
            table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            return table
        }()
    var item = [ "ankan", "aryan"]
    
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            title = "todo"
           // view.addSubview(label)
            view.addSubview(table)
            table.dataSource = self
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return item.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = item[indexPath.row]
            return cell
        }
        
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: 0,
                             y: 100,
                             width: view.frame.size.width,
                             height: 80)
        table.frame = view.bounds
    }
    
        
    }
