//
//  NotesInteractor.swift
//  My_Note_App
//
//  Created by Yashom on 23/09/24.
//

import Foundation


protocol NotesInteractorProtocol{
    var presenter : NotesPresenterProtocol? {get set}
    
    func getNoteData(id:Users)
    
    
}

class NotesInteractor: NotesInteractorProtocol{
    var presenter: NotesPresenterProtocol?
    
    func getNoteData(id:Users) {
        guard let result = id.userNotes else{
            print("error1")
           // self.presenter?.NotesData(result: result)
            return
        }
        self.presenter?.NotesData(result: result)
        print("success1")
    }
    
    
}
