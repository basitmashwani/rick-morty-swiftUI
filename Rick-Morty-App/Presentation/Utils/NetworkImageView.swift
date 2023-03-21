//
//  NetworkImageView.swift
//  Rick-Morty-App
//
//  Created by Syed Basit on 2022-12-07.
//


import SwiftUI
struct NetworkImageView: View {

@ObservedObject fileprivate var imageModel: NetworkImageModel
var defaultImage = UIImage(systemName: "photo")

init(urlString: String?) {
    imageModel = NetworkImageModel(urlString: urlString)
}

var body: some View {
    Image(uiImage: imageModel.image ?? defaultImage!)
        .resizable()
        .scaledToFill()
}

}

fileprivate class NetworkImageModel: ObservableObject {
@Published var image: UIImage?
var urlString: String?

init(urlString: String?) {
    self.urlString = urlString
    loadImage()
}

func loadImage() {
    loadImageFromUrl()
}

func loadImageFromUrl() {
    guard let urlString = urlString else {
        return
    }
    
    let url = URL(string: urlString)!
    let task = URLSession.shared.dataTask(with: url, completionHandler:
getImageFromResponse(data:response:error:))
    task.resume()
}


func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
    guard error == nil else {
        print("Error: \(error!)")
        return
    }
    guard let data = data else {
        print("No data found")
        return
    }
    
    DispatchQueue.main.async {
        guard let loadedImage = UIImage(data: data) else {
            return
        }
        self.image = loadedImage
    }
}
}
