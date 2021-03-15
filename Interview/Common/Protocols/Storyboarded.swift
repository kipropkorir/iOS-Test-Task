//
//  Storyboarded.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {

        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboardName = "Main"
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)

        guard let vc = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError("failed to instatiate \(className) from Storyboard")
        }
        return vc
    }
}
