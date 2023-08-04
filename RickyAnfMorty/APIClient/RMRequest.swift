//
//  RMRequest.swift
//  RickyAnfMorty
//
//  Created by Tanmay Yadav on 04/08/23.
//

import Foundation


/// Object that represents the single API call

final class RMRequest {
    //Base url
    //End point
    //Path components
    //Query Paramters (Optional)
    
    //Constructed Url for api in the string format
    ///API constants
    private struct Constansts{
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    ///Desired endpoint
    private let endPoint: RMEndpoint
    
    ///Path components for API, if any
    private let pathComponents: Set<String> 
    
    ///Query parameters for API, if any
    private let queryParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constansts.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty{
            string += "/"
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty{
            string += "?"
            let arguementString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += arguementString
        }
        
        return string
    }
    
    public var url: URL?{
        return URL(string:urlString)
    }
    
    public let httpMethod = "GET"
    
    
    //Mark: -public
    
    init(
         endPoint: RMEndpoint,
         pathComponents: Set<String> = [],
         queryParameters: [URLQueryItem] = []
    ) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
