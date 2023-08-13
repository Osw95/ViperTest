//
//  endpoint.swift
//  ViperTest
//
//  Created by Oswaldo Ferral Mejia on 11/08/23.
//

import Foundation

enum endpoint{
    
    static let baseUrl = "https://api.tvmaze.com/"
    
    case searchShow(query: String)
    
    case searchPeople(query: String)
    
}

extension endpoint {
        
    var url: URL? {
        
        var path = ""
        
        switch self {
            
        case .searchShow(query: let query):
            
            path = "search/shows?q="
            
            return URL(string: "\(endpoint.baseUrl)\(path)\(query)")
            
        case .searchPeople(query: let query):
            
            path = "search/people?q="
            
            return URL(string: "\(endpoint.baseUrl)\(path)\(query)")
            
        }
    
    }
    
}
