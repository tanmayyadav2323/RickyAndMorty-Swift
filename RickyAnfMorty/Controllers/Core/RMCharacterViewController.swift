//
//  RMCharacterViewController.swift
//  RickyAnfMorty
//
//  Created by Tanmay Yadav on 03/08/23.
//

import UIKit


///Controller to search and show for characters

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
            endPoint: .character,
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
                
            ]
        )
        
        RMService.shared.execute(request, expecting: RMCharacter.self){result in
            switch result
            {
            case .success:
                break
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
