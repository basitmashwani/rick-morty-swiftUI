//
//  CharacterListView.swift
//  Rick-Morty-App
//
//  Created by Syed Basit on 2022-12-07.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel: CharacterListViewModel
    let router: CharacterListRouter
    @State private var searchText = ""
    @State private var showAlert = false
    var body: some View {
        NavigationView {
            
            VStack {
             //   SearchTextField
                
                List(searchText.isEmpty ? viewModel.characters : viewModel.filter(by: $searchText)) { character in
                    
                    NavigationLink {
                        router.routeToCharacterDetailView(character: character)
                    } label: {
                        CharacterRowView(viewModel: viewModel.row(for: character))
                        
                    }
                }
                .searchable(text: $searchText)
                .listStyle(.plain)
                .background(Color.clear)
            }
            .padding()
            .navigationTitle(viewModel.title)
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
        .alert(viewModel.errorMessage, isPresented: Binding.constant(!viewModel.errorMessage.isEmpty)) {
            
        }
        
    }
    
    @ViewBuilder
    var SearchTextField: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search ..", text: $searchText)
        }
        .padding()
        .frame(height: 40)
        .foregroundColor(.gray)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(
            viewModel: .init(
                useCase: CharacterUseCase(
                    characterRepository: CharacterRepository()
                    )),
            router: .init()
        )
    }
}
