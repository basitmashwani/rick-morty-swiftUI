//
//  CharacterDetailViewController.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblSpecies: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    let viewModel: CharacterDetailViewModel

    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
    }

    private func bind(to viewModel: CharacterDetailViewModel) {
        lblName.text = viewModel.name
        lblGender.text = viewModel.gender
        lblStatus.text = viewModel.status
        lblSpecies.text = viewModel.species
        lblLocation.text = viewModel.location
        imgProfile.loadImageUsingCache(withUrl: viewModel.imageURL)
    }
}
