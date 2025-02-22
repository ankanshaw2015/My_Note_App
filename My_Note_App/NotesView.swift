//
//  NotesView.swift
//  My_Note_App
//
//  Created by Yashom on 23/09/24.
//

import Foundation
import UIKit

protocol NotesViewProtocol{
    var presenter: NotesPresenterProtocol? { get set }
    
    func update(with notes: [NotesInfo])
  
    
}

class MyNotesViewController: UIViewController,NotesViewProtocol,UITableViewDelegate,UITableViewDataSource{

    
    
    private    let table = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
       // table.delegate = self
       // table.dataSource = self
        return table
    }()
    
    private let label: UILabel = {
        
         let label = UILabel()
        label.textAlignment = .center
        label.text = "Note"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()

    
    var presenter: NotesPresenterProtocol?
    
    var myNote :[NotesInfo] = []
    
    //***********************************
    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter?.viewDidLoad()
        view.addSubview(table)
        view.addSubview(label)
        table.dataSource = self
        table.delegate = self
        //done()
        align()
    }
    
    func align(){
        table.frame = view.bounds
        label.frame = CGRect(x: 0,
                             y: 100,
                             width: view.frame.size.width,
                             height: 80)
        table.frame = view.bounds
    }
    
    func update(with notes: [NotesInfo]) {
        DispatchQueue.main.async { [self] in
            self.myNote = notes
            self.label.isHidden = true
            self.table.reloadData()
            self.table.isHidden = false
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        }
        
    }
   @objc func didTapAdd(){
        label.text = "done through"
        print("really done")
    }
    
    func update(with error: String) {
        print("error occured")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myNote.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        var content = cell.defaultContentConfiguration()
        content.text = myNote[indexPath.row].noteTitle
        content.secondaryText = myNote[indexPath.row].noteInfo
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.detailNote(myNote[indexPath.row])
    }
    
    
}
