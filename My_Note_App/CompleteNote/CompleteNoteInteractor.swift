//
//  CompleteNoteInteractor.swift
//  My_Note_App
//
//  Created by Yashom on 24/09/24.
//

import Foundation
protocol CompleteNoteInteractorProtocol{
    var presenter : CompleteNotePresenterProtocol?{get set}
    var note : NotesInfo?{get set}
    
    func getNote()
}

class CompleteNoteInteractor:CompleteNoteInteractorProtocol{
    var presenter: CompleteNotePresenterProtocol?
    
    var note: NotesInfo?
    
    func getNote() {
        presenter?.updateData(note: note)
        print(note?.noteInfo ?? "no value found")
    }
    
    
}
