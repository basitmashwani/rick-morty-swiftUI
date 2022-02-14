//
//  CharacterListViewModel.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

enum CharacterListViewState: Equatable {
    case loading
    case loaded
    case failed(String?)
}

protocol CharacterListViewModelInput {
    func viewDidLoad()
    func row(at index: Int) -> CharacterCellItemViewModel
    func filter(by value: String)
    func getSelectedItem(at index: Int) -> Character
}

protocol CharacterListViewModelOutput {
    var numberOfRows: Int { get }
    var title: String { get }
}

protocol CharacterListViewModelProtocol: CharacterListViewModelInput, CharacterListViewModelOutput { }

final class CharacterListViewModel: CharacterListViewModelProtocol {
    // MARK: - Properties
    var viewStateUpdated: ((CharacterListViewState) -> Void)?
    private let useCase: CharacterUseCaseProtocol
    private var cellItems: [CharacterCellItemViewModel] = []
    private var characters: [Character] = []
    private var filteredCharacters: [Character] = []
    // MARK: - Initializer
    init(useCase: CharacterUseCaseProtocol) {
        self.useCase = useCase
    }

    private func onSuccess(data: [Character]) {
        characters = data
        filteredCharacters = characters
        cellItems = characters.map { CharacterCellItemViewModel(item: $0) }
        viewStateUpdated?(.loaded)
    }

    private func onFailure(errorMessage: String) {
        viewStateUpdated?(.failed(errorMessage))
    }

    // MARK: - Output
    var numberOfRows: Int { filteredCharacters.count }
    var title: String { "Characters" }

    // MARK: - Input
    func viewDidLoad() {
        viewStateUpdated?(.loading)
        useCase.loadCharacters { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let characters):
                self.onSuccess(data: characters)
            case .failure(let error):
                self.onFailure(errorMessage: error.localizedDescription)
            }
        }
    }

    func row(at index: Int) -> CharacterCellItemViewModel {
        CharacterCellItemViewModel(item: filteredCharacters[index])
    }

    func filter(by value: String) {
        if value.isEmpty {
            filteredCharacters = characters
        } else {
        filteredCharacters = characters.filter { $0.name.contains(value) }
        }
    }

    func getSelectedItem(at index: Int) -> Character {
        filteredCharacters[index]
    }
}
