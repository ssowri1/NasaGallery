//
//  URLComponents.swift
//  NasaGallery
//
//  Created by Sowrirajan S on 21/11/22.
//

import Foundation

public typealias Parameters = [String: Any]

extension ApiConstansts {
    static func fetchUrl(_ path: servicePath, _ payload: Parameters? = nil) -> URL {
        switch path {
        case .nasaPictures : return configuration(.nasaPictures)
        }
    }
    
    // configuring api
    static func configuration(_ path: servicePath, query: [String: String]? = nil) -> URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path.rawValue
        components.setQueryItems(with: query ?? [:])
        return components.url!
    }
}

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
