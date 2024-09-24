//
//  NotesEntity.swift
//  My_Note_App
//
//  Created by Yashom on 23/09/24.
//

import Foundation

struct NotesInfo{
    var noteTitle: String
    var noteInfo: String
}

class Users{
    var userId:Int?
    var userName:String?
    var userEmail:String?
    var userPassword:String?
    var userNotes:[NotesInfo]?
}
