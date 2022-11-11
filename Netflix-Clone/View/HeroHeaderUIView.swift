//
//  HeroHeaderUIView.swift
//  Netflix-Clone
//
//  Created by User-P2 on 11/11/22.
//

import UIKit

class HeroHeaderUIView: UIView {

    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.borderColor = UIColor.systemRed.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.borderColor = UIColor.systemRed.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "poster-pluto.jpg")
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(self.heroImageView)
        addGradientSubLayer()
        addSubview(self.playButton)
        addSubview(self.downloadButton)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.heroImageView.frame = bounds
    }
    
    private func applyConstraints() {
        let playButttonConstraints = [
            self.playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            self.playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            self.playButton.widthAnchor.constraint(equalToConstant: 110)
        ]
        
        let downloadButtonConstraints = [
            self.downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            self.downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            self.downloadButton.widthAnchor.constraint(equalToConstant: 110)
        ]
        
        NSLayoutConstraint.activate(playButttonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
        
    }
    
    private func addGradientSubLayer() {
        let gradientSubLayer = CAGradientLayer()
        gradientSubLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientSubLayer.frame = bounds
        layer.addSublayer(gradientSubLayer)
    }

}
