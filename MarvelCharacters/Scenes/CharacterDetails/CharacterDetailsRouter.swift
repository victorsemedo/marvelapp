//
//  CharacterDetailsRouter.swift
//  MarvelCharacters
//
//  Created by Victor Tavares on 14/01/21.
//

import UIKit

protocol CharacterDetailsRoutingLogic {
}

protocol CharacterDetailsDataPassing {
    var dataStore: CharacterDetailsDataStore? { get }
}

final class CharacterDetailsRouter: CharacterDetailsDataPassing {
    private weak var viewController: UIViewController?
    var dataStore: CharacterDetailsDataStore?
    
    init(viewController: UIViewController, dataStore: CharacterDetailsDataStore? = nil) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

// MARK: Routing Logic Protocol
extension CharacterDetailsRouter: CharacterDetailsRoutingLogic {
    
}

