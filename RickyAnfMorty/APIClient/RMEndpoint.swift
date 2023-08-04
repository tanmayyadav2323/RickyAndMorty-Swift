//
//  RMEndPoint.swift
//  RickyAnfMorty
//
//  Created by Tanmay Yadav on 04/08/23.
//

import Foundation


/// Represents the uniqiue API endpoints
@frozen enum RMEndpoint: String{
    ///Endpoint to get character info
    case character
    ///Endpoint to get location info
    case location
    ///Endpoint to get episode info
    case episode
}
