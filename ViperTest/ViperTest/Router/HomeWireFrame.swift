//
//  HomeWireFrame.swift
//  ViperTest
//
//  Created by Oswaldo Ferral on 28/07/23.
//  
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {

    class func createHomeModule() -> UIViewController {
        
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "InitialNavigationCtrl")
        
        ///Encontramos el primer controlador de la vista hijo y casteamos a HomeViewcontroller
        ///Esto funciona solo con un navigation controler por eso buscamos el primer hijo del nav controller
        /// Si lo quisiera hacer directo a un controller debemos de cambiar navController.children.first A solo la variable , osea quitarle children. first
        if let view = navController.children.first as? HomeViewController {
            
            
            ///Inicializamos todos los componentes de viper haciendo uso de los protocolos una manera de decirlo es que inicialisamos
            ///Todas las clases que cumplan con los protocolos
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            
            let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
            
            let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
            
            let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
            
            let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
            
            ///Ahora asignamos cada referencia a los componentes
            
            view.presenter = presenter
            
            presenter.view = view
            
            presenter.wireFrame = wireFrame
            
            presenter.interactor = interactor
            
            interactor.presenter = presenter
            
            interactor.localDatamanager = localDataManager
            
            interactor.remoteDatamanager = remoteDataManager
            
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
            
        }
        
        return UIViewController()
        
    }
    
    static var mainStoryboard: UIStoryboard {
        
        return UIStoryboard(name:"HomeView", bundle: Bundle.main)
        
    }
    
}
