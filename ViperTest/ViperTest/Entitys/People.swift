//
//  People.swift
//  ViperTest
//
//  Created by Oswaldo Ferral Mejia on 13/08/23.
//

import Foundation


struct peopleList:Codable{
    var results:[people]
}

struct people:Codable{
    let score:String
    let pesron:personInfo?
}

struct personInfo:Codable{
    let id:Int
    let url:String
    let name:String
    let country:countryInfo?
    let birthday:String?
    let deathday:String?
    let gender:String
    let image:imageInfo?
}

struct countryInfo:Codable{
    let name:String?
    let code:String?
    let timezone:String?
}

struct imageInfo:Codable{
    let medium:String?
    let original:String?
}
