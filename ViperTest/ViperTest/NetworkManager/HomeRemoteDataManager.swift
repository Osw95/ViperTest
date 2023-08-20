//
//  HomeRemoteDataManager.swift
//  ViperTest
//
//  Created by Oswaldo Ferral on 28/07/23.
//  
//

import Foundation


enum NetworkResponse<T: Decodable>{
    case success(T)
    case failure(Error)
}

struct Resource<T> {
    let url: URL?
    let parse: (Data) -> T
}

final class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    func load<T>(resource: URL?, completion: @escaping (NetworkResponse<[T]>) -> ()) {
        
        var task:URLSessionTask
        
        guard let url = resource else { return }
        
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                
                print("Este es el error \(error)")
                
                completion(.failure(error))
                
                return
                
            }
            
            if let data = data {
            
                do{
                    
                    let decoder = JSONDecoder()
                    
                    let object = try decoder.decode([T].self, from: data)
                                        
                    completion(.success(object))
                    
                }catch{
                    
                    completion(.failure(error))
                    
                }
                
                
                return
                
            }
            
        }
        
        task.resume()
        
    }
    
}
