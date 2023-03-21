//
//  CharacterDetailView.swift
//  Rick-Morty-App
//
//  Created by Syed Basit on 2023-03-20.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var viewModel: CharacterDetailViewModel
    var body: some View {
        ScrollView {
            VStack {
            
            Spacer()
            HStack {
                Text(viewModel.name)
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
            }
            
            NetworkImageView(urlString: viewModel.imageURL)
            
            HStack(alignment: .top) {
                Text("INFO")
                    .padding()
                Spacer()
            }
            
                VStack(spacing: 0) {
                    
                    CharacterDetailLine(title: "Species", value: viewModel.species)
                    
                    Divider()
                    
                    CharacterDetailLine(title: "Status", value: viewModel.status)
                    
                    Divider()
                    
                    CharacterDetailLine(title: "Gender", value: viewModel.gender)
                    
                    Divider()
                    
                    CharacterDetailLine(title: "Current Location", value: viewModel.location)
                }
            
            Spacer()
        }
    }
        .background(Color(red: 239.0/255.0, green: 238.0/255, blue: 246.0/255))
        
    }
}

struct CharacterDetailLine: View {
    let title: String
    let value: String
    var body: some View {
            HStack {
                
                Text(title)
                    .padding([.leading])
                
                Spacer()
                
                Text(value)
                    .padding([.trailing])
            }
        .frame(height: 50)
        .background(Color.white)

    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(viewModel: .init(character: .mock))
    }
}
