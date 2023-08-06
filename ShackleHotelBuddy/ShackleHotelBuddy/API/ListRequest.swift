//
//  ListRequest.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 06/08/2023.
//

import Foundation

struct ListRequest: ApiRequestable {
    
    struct ResponseType: Decodable {
        let dataX: String?
    }
    
    struct ApiDate: Codable {
        let day: Int
        let month: Int
        let year: Int
    }
    
    struct Parameters: Encodable {

        struct Region: Codable {
            let regionId: String
        }

        struct Child: Codable {
            let age: Int
        }
        struct Room: Codable {
            let adults: Int
            let children: [Child]
        }
        
        let currency: String = "USD"
        let eapid: Int = 1
        let locale: String = "en_US"
        let siteId: Int = 300000001
        let destination: Region = Region(regionId: "6054439")
        let checkInDate: ApiDate = .init(day: 10, month: 10, year: 2023)
        let checkOutDate: ApiDate = .init(day: 15, month: 10, year: 2023)
        let rooms: [Room] = [.init(adults: 2, children: [.init(age: 5), .init(age: 7)])]
        
        let resultsStartingIndex: Int
        let resultSize: Int = 200
        let sort = "PRICE_LOW_TO_HIGH"
    }
    
    let endpoint = "properties/v2/list"
    let parameters: Parameters
}
