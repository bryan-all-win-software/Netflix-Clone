//
//  CollectionViewTableViewCell.swift
//  Netflix-Clone
//
//  Created by User-P2 on 11/11/22.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"
    
    private var moviesOrTvs: [MovieOrTv] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MovieOrTvCollectionViewCell.self, forCellWithReuseIdentifier: MovieOrTvCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .systemGreen
        self.contentView.addSubview(self.collectionView)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionView.frame = self.contentView.bounds
    }
    
    public func configure(with movieOrTv: [MovieOrTv]) {
        self.moviesOrTvs = movieOrTv
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.moviesOrTvs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieOrTvCollectionViewCell.identifier, for: indexPath) as? MovieOrTvCollectionViewCell else { return UICollectionViewCell()}
        guard let modelImage = moviesOrTvs[indexPath.row].poster_path else { return UICollectionViewCell() }
        cell.configureCell(url: modelImage)
        return cell
    }
    
    
}
