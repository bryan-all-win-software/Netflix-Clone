//
//  DownloadViewController.swift
//  Netflix-Clone
//
//  Created by User-P2 on 11/10/22.
//

import UIKit

class DownloadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
    }
    
    private func setUI() {
        let button: UIButton = {
            let button = UIButton()
            button.setTitle("I'm Downloads", for: .normal)
            button.backgroundColor = .black
            button.frame = CGRect(x: self.view.center.x / 2, y: self.view.center.y, width: 200, height: 100)
            return button
        }()
        
        let view = UIView()
        view.addSubview(button)
        self.view.addSubview(view)
    }
    
}
