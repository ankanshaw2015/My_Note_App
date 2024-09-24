//
//  Entity.swift
//  My_Note_App
//
//  Created by Yashom on 21/09/24.
//

import Foundation

class User{
    var email=String()
    var password = String()
    
    init(email: String = String(), password: String = String()) {
        self.email = email
        self.password = password
    }
}

class Notes{
    var id : String
    var title : String
    var note : String
    init(id: String , title: String, note: String ) {
        self.id = id
        self.title = title
        self.note = note
    }
}
