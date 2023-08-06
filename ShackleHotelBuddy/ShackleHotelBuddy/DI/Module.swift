//
//  Module.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 06/08/2023.
//

import Foundation

final class Injector {
    
    static var shared: Injector = .init()
    
    private init() {}
    
    lazy var apiService: ShackleApi = .init(
        apiService: .init(
            baseUrl: Consts.baseUrl,
            headers: Consts.headers
        )
    )
    
    lazy var homePresenter: HomePresenter = HomePresenter(apiService: apiService)
    
}

fileprivate extension Consts {
    static let baseUrl = URL(string: "https://hotels4.p.rapidapi.com")!
    
    static let headers =  [
        "content-type": "application/json",
        "X-RapidAPI-Key": "f4bbfa88b8mshb10526c17b58ca6p1edf4ejsnc450431dc2cb",
        "X-RapidAPI-Host": "hotels4.p.rapidapi.com"
    ]
}
