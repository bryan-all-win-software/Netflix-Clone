//
//  Extensions.swift
//  Netflix-Clone
//
//  Created by User-P2 on 11/15/22.
//

import Foundation


extension String {
    
    func capitalizedFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
}
