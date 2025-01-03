//
//  QuestionDetailCardCollectionViewCell.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 7.07.2024.
//

import UIKit

class QuestionDetailCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with question: Soru) {
        questionLabel.text = question.soruMetni
    }
}
