//
//  CollectionViewCell.swift
//  TestWorkSiberian3
//
//  Created by Наташа on 18.07.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let reuseID = String(describing: CollectionViewCell.self)
    static let nib = UINib(nibName: String(describing: CollectionViewCell.self), bundle: nil)
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var timeTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 4
        dateTextLabel.font = UIFont.systemFont(ofSize: 18)
        timeTextLabel.font = UIFont.systemFont(ofSize: 18)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateContentStyle()
    }
    
    func update(title: String, image: UIImage) {
        cellImageView.image = image
        dateTextLabel.text = "01-january-2022"
    }
    
    private func updateContentStyle() {
        let isHorizontalStyle = bounds.width > 2 * bounds.height
        let oldAxis = stackView.axis
        let newAxis: NSLayoutConstraint.Axis = isHorizontalStyle ? .horizontal : .vertical
        guard oldAxis != newAxis else { return }
        
        stackView.axis = newAxis
        stackView.spacing = isHorizontalStyle ? 16 : 4
        dateTextLabel.textAlignment = isHorizontalStyle ? .left : .center
        let fontTransform: CGAffineTransform = isHorizontalStyle ? .identity : CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.3) {
            self.dateTextLabel.transform = fontTransform
            self.layoutIfNeeded()
        }
    }
}


