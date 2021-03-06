//
//  CharacterDetailsViewControllerSpy.swift
//  MarvelCharacters
//
//  Created by Victor Tavares on 19/01/21.
//

@testable import MarvelCharacters

class CharacterDetailsViewControllerSpy: UIViewControllerSpy {
    var displayCharacterCalled = false
    var displayComicsAndSeriesCalled = false
    var displayUpdateFavoriteCalled = false
    var displayComicsAndSeriesErrorCalled = false
    var displayErrorCalled = false

}

extension CharacterDetailsViewControllerSpy: CharacterDetailsDisplayLogic {
    
    func displayCharacter(viewModel: CharacterDetails.LoadCharacter.ViewModel) {
        displayCharacterCalled = true
    }
    
    func displayComicsAndSeries(viewModel: CharacterDetails.LoadComicsSeries.ViewModel) {
        displayComicsAndSeriesCalled = true
    }
    
    func displayUpdateFavorite(viewModel: CharacterDetails.UpdateFavorite.ViewModel) {
        displayUpdateFavoriteCalled = true
    }
    
    func displayComicsAndSeriesError(isComics: Bool, message: String) {
        displayComicsAndSeriesErrorCalled = true
    }
    
    func displayError(title: String, message: String) {
        displayErrorCalled = true
    }
    
}
