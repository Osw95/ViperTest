//
//  HomeRemoteDataManager.swift
//  ViperTest
//
//  Created by Oswaldo Ferral on 28/07/23.
//  
//

import Foundation

enum NetworkResponse<T>{
    case success(T)
    case failure(Error)
}

struct Resource<T> {
    let url: URL?
    let parse: (Data) -> T
}

final class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    func load<T>(resource: Resource<T>, completion: @escaping (NetworkResponse<T>) -> ()) {
        
        var task:URLSessionTask
        
        guard let url = resource.url else { return }
        
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                
                completion(NetworkResponse.failure(error))
                
                return
            }
            
            if let data = data {
                
                completion(NetworkResponse.success(resource.parse(data)))
                
            }
            
        }
        
        task.resume()
        
    }
    
    
    
    
    
}
