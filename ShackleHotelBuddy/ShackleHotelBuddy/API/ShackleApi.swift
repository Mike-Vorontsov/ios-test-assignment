//
//  ShackleApi.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 06/08/2023.
//

import Combine
import Foundation

protocol ListApiFetching {
    func fetchList(with parameters: ListRequest.Parameters) -> any Publisher<ListRequest.ResponseType, Error>
}

struct ListResponse: Codable {
    let dataX: String?
}

final class ShackleApi {
    let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
}

extension  ShackleApi: ListApiFetching {
    func fetchList(with parameters: ListRequest.Parameters) -> any Publisher<ListRequest.ResponseType, Error> {
        apiService.fetch(from: ListRequest(parameters: parameters))
    }
}
