//
//  HomeProtocols.swift
//  ViperTest
//
//  Created by Oswaldo Ferral on 28/07/23.
//  
//
///En los protocolos se usan el AnyObject esto para restringir su uso asi que estos protocolos solo van a poder ser usado por clases
///Recuerda que otra manera de llamar al router es wireframe

import Foundation
import UIKit


protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
}

protocol HomeWireFrameProtocol: AnyObject {
    // PRESENTER -> ROUTER
    static func createHomeModule() -> UIViewController
}

protocol HomePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol HomeInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    
    func interactorGetData()
    
}

protocol HomeDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
    
}

protocol HomeRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    
    func load<T>(resource: URL?, completion: @escaping (NetworkResponse<[T]>) -> ())
}

protocol HomeRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteCallBackData<T>(dataApi:(NetworkResponse<[T]>))
    //func remoteCallBackData2<T>(completion: @escaping (NetworkResponse<T>) -> ())
}

protocol HomeLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
