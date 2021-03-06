//
//  CharactersFactory.swift
//  MarvelCharacters
//
//  Created by Victor Tavares on 09/01/21.
//

import UIKit

final class CharactersFactory {
    static func setupCharacters(selectedCharacterIndex: Int? = nil) -> UIViewController {
        let viewController = CharactersViewController()
        let worker = CharactersWorker()
        let presenter = CharactersPresenter(viewController: viewController)
        let interactor = CharactersInteractor(presenter: presenter, worker: worker)
        interactor.selectedCharacterIndex = selectedCharacterIndex
        let router = CharactersRouter(viewController: viewController, dataStore: interactor)
        viewController.setup(interactor: interactor, router: router)
        return viewController
    }
}
