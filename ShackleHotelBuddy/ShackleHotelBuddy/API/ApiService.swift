//
//  ApiService.swift
//  ShackleHotelBuddy
//
//  Created by Mykhailo Vorontsov on 06/08/2023.
//

import Foundation
import Combine

protocol ApiFetching {
    func fetch<ResponseType: Decodable>(from request:some ApiRequestable<ResponseType> ) -> any Publisher<ResponseType, Error>
}

protocol ApiRequestable<ResponseType> {
    associatedtype ResponseType: Decodable
    associatedtype Parameters: Encodable
    var endpoint: String { get }
    var parameters: Parameters { get }
}

protocol URLSessionPublishing  {
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher
}

extension URLSession: URLSessionPublishing {}

final class ApiService: ApiFetching {
    
    enum NetworkError: Error {
        case code(Int, Data?)
        case parsing(Error, Data)
        case noData
        case network(Error)
        case other(Error?)
    }
    
    init(baseUrl: URL, urlSession: URLSessionPublishing = URLSession.shared, headers: [String: String]) {
        self.baseUrl = baseUrl
        self.urlSession = urlSession
        self.headers = headers
    }
    
    let baseUrl: URL
    let urlSession: URLSessionPublishing
    let headers: [String: String]

    lazy var encoder = JSONEncoder()
    lazy var decoder = JSONDecoder()
    
    
    func fetch<ResponseType: Decodable>(from request:some ApiRequestable<ResponseType> ) -> any Publisher<ResponseType, Error> {
        let url = baseUrl.appending(path: request.endpoint)
        var urlRequest = URLRequest(url: url)
        
        do {
            urlRequest.httpBody = try encoder.encode(request.parameters)
        } catch {
            return Fail(error: NetworkError.other(error))
        }

        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = headers
        
        let publisher = urlSession
            .dataTaskPublisher(for: urlRequest)
            .tryMap{ (data, response) -> (Data, HTTPURLResponse) in
                guard let response = response as? HTTPURLResponse else { throw NetworkError.other(nil) }
                
                return (data, response)
            }
            .tryMap { (data, response) -> Data? in
                guard (200..<300) .contains(response.statusCode) else { throw NetworkError.code(response.statusCode, data) }
                return data
            }
            .tryMap { data -> Data in
                guard let data else {  throw NetworkError.noData }
                return data
            }
            .tryMap{ data -> ResponseType in
                try self.decoder.decode(ResponseType.self, from: data)
            }
        
        return publisher
    }        
    
}
