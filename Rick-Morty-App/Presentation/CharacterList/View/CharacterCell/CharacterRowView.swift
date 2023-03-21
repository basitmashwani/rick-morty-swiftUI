//
//  CharacterRow.swift
//  Rick-Morty-App
//
//  Created by Syed Basit on 2022-12-07.
//

import SwiftUI

struct CharacterRowView: View {
    let viewModel: CharacterCellItemViewModel
    var body: some View {
        HStack {
            NetworkImageView(urlString: viewModel.imageURL)
                .frame(width: 50, height: 50)
                .cornerRadius(25)
                .padding(.trailing)
            
            VStack {
             
                Text(viewModel.name)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(viewModel.episodeCount)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)

            }
            Spacer()
        }
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView(viewModel: .init(item: Character.mock))
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("default preview")
    }
}
