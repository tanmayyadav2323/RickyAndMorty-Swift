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
    ///   - completion: Callback with data or error

    public func execute(_ request:RMRequest, completion: @escaping ()-> Void){
        
    }
}
