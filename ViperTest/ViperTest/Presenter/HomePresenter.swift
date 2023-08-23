//
//  HomePresenter.swift
//  ViperTest
//
//  Created by Oswaldo Ferral on 28/07/23.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        
        interactor?.interactorGetData()
        
        print("Hola recuerda que esto no es más que un simple metodo llamado desde el viewdidload del controller")
    
        
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func interactorPushDataPresenter(dataShow: [tvShow]) {
        
        view?.presenterPushDataView(dataShow: dataShow)
        
    }
    
    // TODO: implement interactor output methods
}
