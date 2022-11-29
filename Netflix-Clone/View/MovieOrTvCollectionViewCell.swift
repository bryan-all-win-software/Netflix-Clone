//
//  MovieOrTvCollectionViewCell.swift
//  Netflix-Clone
//
//  Created by User-P2 on 11/18/22.
//

import UIKit
import SDWebImage

class MovieOrTvCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieOrTvCollectionViewCell"
    
    let posterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.posterImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.posterImage.frame = self.contentView.bounds
    }
    
    public func configureCell(url: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(url)") else { return }
        self.posterImage.sd_setImage(with: url, completed: nil)
    }
    
}
