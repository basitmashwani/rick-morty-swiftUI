//
//  CharacterTableViewCell.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEpisode: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!

    func configure(with item: CharacterCellItemViewModel) {
        lblName.text = item.name
        lblEpisode.text = item.episodeCount
        imgLogo.loadImageUsingCache(withUrl: item.imageURL)
        imgLogo.roundedImage()
    }
}
