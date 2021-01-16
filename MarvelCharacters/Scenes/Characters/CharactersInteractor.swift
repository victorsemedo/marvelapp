//
//  CharactersInteractor.swift
//  MarvelCharacters
//
//  Created by Victor Tavares on 09/01/21.
//

import UIKit

protocol CharactersBusinessLogic {
    func loadNextPage(request: Characters.LoadNextPage.Request)
    func updateFavorite(request: Characters.UpdateFavorite.Request)
    func selectCharacter(request: Characters.SelectCharacter.Request)
}

protocol CharactersDataStore {
    var selectedCharacter: Character? { get }
}

class CharactersInteractor: CharactersDataStore {
    private var presenter: CharactersPresentationLogic?
    private var worker: CharactersWorkLogic
    
    var selectedCharacter: Character?
    
    private var currentPage =  0
    private var characters = [Character]()
    
    init(presenter: CharactersPresentationLogic, worker: CharactersWorkLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

//MARK: Business Logic Protocol
extension CharactersInteractor: CharactersBusinessLogic {
    
    func loadNextPage(request: Characters.LoadNextPage.Request) {
        worker.loadNextPage(request: request) { (result) in
            switch result {
            case .success(var response):
                self.updateCharacters(withResponse: response.characters, reset: request.reset)
                response.favorites = self.getFavoritesIds()
                self.presenter?.presentLoadNextPage(response: response)
            case .failure(let error):
                break
            }
        }
    }
    
    func updateFavorite(request: Characters.UpdateFavorite.Request) {
        let character = characters[request.index]
        if request.isFavorite {
            worker.saveFovoriteCharacter(character, image: request.image)
        } else {
            worker.deleteFavoriteCharacter(character)
        }
    }
    
    func selectCharacter(request: Characters.SelectCharacter.Request) {
        selectedCharacter = characters[request.index]
    }
    
}

private extension CharactersInteractor {
    
    func getFavoritesIds() -> [Int] {
        let favorites = worker.loadFavoriteCharacters()
        return favorites.map { $0.id }
    }
    
    func updateCharacters(withResponse response: [Character]?, reset: Bool) {
        guard let response = response else { return }
        
        if reset {
            characters = response
        } else {
            characters.append(contentsOf: response)
        }
    }
}
