//
//  Interactor.swift
//  My_Note_App
//
//  Created by Yashom on 21/09/24.
//

import Foundation
class Interactor{
    var data : [User] = []
    var noteData : [Notes] = []
    
    let new = Notes(id: "1", title: "a", note: "A")
    
    func check(email : String, password : String) -> Bool{
        for i in data{
            if i.email == email && i.password == password{
                return true
            }
        }
        return false
    }
    
    func addData(email: String, password: String){
        let user = User(email: email,password: password)
        data.append(user)
    }
    
    func addNote(id:String,title:String,note:String){
        let note = Notes(id: "1", title: "title", note: "note")
        noteData.append(note)
        
    }
    
    func fetchNote() -> [ Notes]{
        return noteData
    }
    
}
