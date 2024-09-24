//
//  NotesPresenter.swift
//  My_Note_App
//
//  Created by Yashom on 23/09/24.
//

import Foundation

protocol NotesPresenterProtocol{
    
    var view: NotesViewProtocol?{get set}
    var interactor: NotesInteractorProtocol?{get set}
    var router: NotesRouterProtocol?{get set}
    
    func viewDidLoad()
    func NotesData(result: [NotesInfo])
    func detailNote(_ note: NotesInfo)
    func addNewNote()
}

class NotesPresenter: NotesPresenterProtocol{

    
    var view: NotesViewProtocol?
    var interactor: NotesInteractorProtocol?
    
    var router: NotesRouterProtocol?
    
    func viewDidLoad() {
        let user = Users()
        user.userEmail = "aaaa"
        user.userId = 1
        user.userName = "aaa"
        user.userPassword = "1234"
        let note1 = NotesInfo(noteTitle: "hi", noteInfo: "this is ankan")
        let note2 = NotesInfo(noteTitle: "hello", noteInfo: "this is ankan shaw")
        
        user.userNotes = [note1,note2]
        interactor?.getNoteData(id: user)

        print("accept", user.userNotes![0].noteInfo)
    }
    
    func NotesData(result: [NotesInfo]) {
        
        if result.count != 0{
            view?.update(with: result)
                    }
        else{
            print("error")
        }
    }
    
    func detailNote(_ note: NotesInfo) {
        router?.goToDetail(note: note)
    }
    
    func addNewNote() {
        
    }
    
}
