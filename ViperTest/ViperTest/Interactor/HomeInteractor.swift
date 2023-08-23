//
//  HomeInteractor.swift
//  ViperTest
//
//  Created by Oswaldo Ferral on 28/07/23.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?

}


extension HomeInteractor {
    
    func interactorGetData(){
        
        remoteDatamanager?.load(resource: endpoint.searchShow(query: "venom").url ) { (result: NetworkResponse<[tvShow]>) in
            
            switch result {
                
            case .success(let dataConsulted):
                
                print(dataConsulted)
                
                self.remoteCallBackData(dataApi: dataConsulted)
                
            case .failure(let errorConsulta):
                
                print("error \(errorConsulta)")
                
            }
            
        }
        
    }
    
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    func remoteCallBackData<T>(dataApi: T) {
        print("Data que estamos enviando \(dataApi)")
        
        presenter?.interactorPushDataPresenter(dataShow: (dataApi as? [tvShow])!)
        
    }
    
}


/// Tengo que mandar llamar la api  y ver que me imprime !!! Aqui me quede 
