//
//  ViewController.swift
//  Netflix-Clone
//
//  Created by User-P2 on 11/10/22.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .systemBackground
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let upCommingViewController = UINavigationController(rootViewController: UpCommingViewController())
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let downloadViewController = UINavigationController(rootViewController: DownloadViewController())
        
        homeViewController.title = "Home"
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        
        upCommingViewController.title = "Up Comming"
        upCommingViewController.tabBarItem.image = UIImage(systemName: "play")
        
        searchViewController.title = "Search Movie"
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        downloadViewController.title = "Downloads"
        downloadViewController.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        tabBar.tintColor = .label
        
        setViewControllers([homeViewController, upCommingViewController, searchViewController, downloadViewController], animated: true)
    }

}

