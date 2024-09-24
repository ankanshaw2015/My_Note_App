//
//  NotesRouter.swift
//  My_Note_App
//
//  Created by Yashom on 23/09/24.
//

import Foundation
import UIKit
protocol NotesRouterProtocol{
    var entry: MyNotesViewController?{get }
    static func startExecution() -> NotesRouterProtocol
    
    func goToDetail(note:NotesInfo)
}
class NotesRouter:NotesRouterProtocol{
    
    var entry: MyNotesViewController?
    
    static func startExecution() -> NotesRouterProtocol {
        let router = NotesRouter()
        let presenter = NotesPresenter()
        let view = MyNotesViewController()
        let interactor = NotesInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        router.entry = view
        return router
    }
    
    func goToDetail(note: NotesInfo) {
        let detailRouter = CompleteNoteRouter.noteDetail(note: note)
        guard let detailView = detailRouter.entry else {return}
        guard let viewController = self.entry else{return}
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
    
    
}
