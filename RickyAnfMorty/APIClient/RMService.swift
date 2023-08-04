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
    
    enum RMServiceError: Error{
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - type: Type of the object we expect to get back
    ///   - completion: Callback with data or error

    public func execute<T: Codable>(_ request: RMRequest,
                                    expecting: T.Type,
        completion: @escaping (Result<T, Error>
    )-> Void){
        guard let urlRequest = self.request(from: request)else{
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest){ data, _, error in
            guard let data = data, error == nil else{
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            //Decode Response
            do{
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    //Mark  --Private
    private func request(from rmRequest: RMRequest)-> URLRequest? {
        guard let url =  rmRequest.url else {
            return  nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
