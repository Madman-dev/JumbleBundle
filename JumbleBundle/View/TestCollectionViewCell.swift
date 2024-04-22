//
//  TestCollectionViewCell.swift
//  JumbleBundle
//
//  Created by Porori on 4/22/24.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "TestCollectionViewCell"
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    func configureLabel(text: String) {
        self.cellLabel.text = text
        self.cellImageView.image = UIImage(systemName: "arrowshape.right.fill")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
