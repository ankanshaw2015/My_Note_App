import Foundation
import UIKit

class NotesUI{
    let table = {
        let table = UITableView()
        table.register(UITableView.self, forCellReuseIdentifier: "cell")
      
        return table
    }()
}

class Presenter{
    var interactor : Interactor = Interactor()
    public static var  presenter:Presenter?
    private init(){}
    static func initializer() -> Presenter{
        if presenter == nil{
            presenter = Presenter()
            return presenter!
        }
        else {
            return presenter!
        }
    }
    
    func search(a:String, b:String) -> Bool{
        let c = interactor.check(email: a, password: b)
        return c
    }
    
    func addData(email: String, password: String){
        interactor.addData(email: email, password: password)
    }
    
    func count() -> Int{
        return interactor.data.count
    }
    
    func addNote(id:String,title:String,note:String){
        let note = Notes(id: "1", title: "title", note: "note")
        interactor.noteData.append(note)
        
    }
    
    func fetchNote() -> [ Notes]{
        return interactor.noteData
    }
}
