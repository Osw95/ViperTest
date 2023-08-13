//
//  Show.swift
//  ViperTest
//
//  Created by Oswaldo Ferral Mejia on 13/08/23.
//

import Foundation

struct showsList: Codable{
    var result:[show]
}

struct show: Codable{
    let score: String?
    let show:showInfo?
}

struct showInfo:Codable{
    let id: Int
    let url: String
    let name: String
    let type: String
    let language: String?
    let genres: [String]
    let status: String
    let officialSite: String?
    let image:imageShowInfo?
    let externals: external?
    let summary:String?
}

struct imageShowInfo: Codable{
    let medium: String?
    let original: String?
}

struct external: Codable {
    let imdb: String?
}
