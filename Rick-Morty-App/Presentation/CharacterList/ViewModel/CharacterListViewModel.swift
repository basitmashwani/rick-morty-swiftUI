//
//  CharacterListViewModel.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import SwiftUI
import Combine


protocol CharacterListViewModelInput {
    func fetchCharacters()
    func row(for character: Character) -> CharacterCellItemViewModel
    func filter(by value: Binding<String>) -> [Character]
}

protocol CharacterListViewModelOutput {
    var title: String { get }
}

protocol CharacterListViewModelProtocol: CharacterListViewModelInput, CharacterListViewModelOutput { }


final class CharacterListViewModel: ObservableObject, CharacterListViewModelProtocol {

    // MARK: - Properties
    private let useCase: CharacterUseCaseProtocol
    private var cellItems: [CharacterCellItemViewModel] = []
    private var cancellables = Set<AnyCancellable>()
   @Published var characters: [Character] = []
    var errorMessage: String = ""
    
    // MARK: - Output
    var title: String { "Characters" }
    

    // MARK: - Initializer
    init(useCase: CharacterUseCaseProtocol) {
        self.useCase = useCase
    }
    
    private func onSuccess(data: [Character]) {
        characters = data
        cellItems = characters.map { CharacterCellItemViewModel(item: $0) }
    }
    
    // MARK: - Input
    
    func fetchCharacters() {
        
        useCase.loadCharacters()
            .receive(on: DispatchQueue.main)
            .sink {[weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished: break
                }
            } receiveValue: { [weak self] characters in
                self?.onSuccess(data: characters)
            }
            .store(in: &cancellables)

    }

    func row(for character: Character) -> CharacterCellItemViewModel {
        CharacterCellItemViewModel(item: character)
    }

    func filter(by value: Binding<String>) -> [Character]  {
       characters.filter { $0.name.contains(value.wrappedValue) }
    }

    
}
