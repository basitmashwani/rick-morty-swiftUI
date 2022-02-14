//
//  CharacterCellViewModel.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import Foundation
struct CharacterCellItemViewModel {
    let name: String
    let episodeCount: String
    let imageURL: String
}

extension CharacterCellItemViewModel {
    init(item: Character) {
        name = item.name
        episodeCount = "\(item.episodeCount) episode(s)"
        imageURL = item.imgURL
    }
}
