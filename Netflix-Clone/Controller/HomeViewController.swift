//
//  HomeViewController.swift
//  Netflix-Clone
//
//  Created by User-P2 on 11/10/22.
//

import UIKit

enum Sections: Int {
    case PopularMovies = 0
    case TrendingMovies = 1
    case UpCommingMovies = 2
    case ToRatedMovies = 3
}

final class HomeViewController: UIViewController {
    
    private let sectionHeaderTitles = [
        "Popular Movies",
        "Trending Movies",
        "Up comming Movies",
        "Top rated"
    ]

    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = self.view.bounds
    }
    
    private func setUI() {
        self.view.addSubview(homeFeedTable)
        self.homeFeedTable.delegate = self
        self.homeFeedTable.dataSource = self
        self.homeFeedTable.tableHeaderView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 450))
        configureNavBar()
    }
    
    private func configureNavBar() {
        var image = #imageLiteral(resourceName: "netflix_logo.png")
        image = image.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        ]
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: #selector(playButtonPressed)),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        self.navigationController?.navigationBar.tintColor = .systemRed
    }
    
    @objc private func playButtonPressed() {
        homeFeedTable.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionHeaderTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionHeaderTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: UIFont.systemFontSize, weight: .bold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y, width: header.bounds.width, height: header.bounds.height)
        header.textLabel?.text = header.textLabel?.text?.capitalizedFirstLetter()
        //TODO: Make the color adaptable based on device system theme
        header.textLabel?.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }

        switch indexPath.section {
            
        case Sections.PopularMovies.rawValue:
            
            APIManager.shared.getPopularMovies { result in
                switch result {
                case .success(let movieOrTv): cell.configure(with: movieOrTv)
                case .failure(let error): debugPrint(error)
                }
            }
            
        case Sections.TrendingMovies.rawValue:
            
            APIManager.shared.getTrendingTvs { result in
                switch result {
                case .success(let movieOrTv): cell.configure(with: movieOrTv)
                case .failure(let error): debugPrint(error)
                }
            }
            
        case Sections.UpCommingMovies.rawValue:
            
            APIManager.shared.getUpCommingMovies { result in
                switch result {
                case .success(let movieOrTv): cell.configure(with: movieOrTv)
                case .failure(let error): debugPrint(error)
                }
            }
            
        case Sections.ToRatedMovies.rawValue:
            
            APIManager.shared.getRatedMovies { result in
                switch result {
                case .success(let movieOrTv): cell.configure(with: movieOrTv)
                case .failure(let error): debugPrint(error)
                }
            }
            
        default:
            debugPrint(NSLocalizedString("Doesn't get data from API Manager", comment: "Error fetching data from API"))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.navigationController?.navigationBar.transform = .init(translationX: 0, y:  min(0, -(scrollView.contentOffset.y)))
    }
    
}
