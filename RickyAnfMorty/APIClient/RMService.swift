//
//  RmService.swift
//  RickyAnfMorty
//
//  Created by Tanmay Yadav on 04/08/23.
//

import Foundation


/// Primary API service object to get Rick and Morty Data

final class RMService{
    
    /// Shared Singleton Instance
    static let shared = RMService()
    
    
    /// Privatized Constructor
    private init(){}
    
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - type: Type of the object we expect to get back
    ///   - completion: Callback with data or error

    public func execute<T: Codable>(_ request: RMRequest,
        expecting: T,
        completion: @escaping (Result<T, Error>
    )-> Void){
        
    }
}
