//
//  HomePageCollectionViewCell.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 30.06.2024.
//

import UIKit

final class HomePageCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setCellDesign()
    }
    
    func setup(with category: Kategori) {
        cellTitle.text = category.isim
        cellView.backgroundColor = UIColor.hexString(category.renk)
        if let icon = UIImage(named: category.iconType.rawValue) {
            cellImage.image = icon
        } else {
            cellImage.image = UIImage(named: "default_image") // Placeholder image
        }
    }
    
    private func setCellDesign() {
        cellView.roundCorners(corners: .allCorners, radius: 5)
    }
}
