//
//  UIView.Controller+swift.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import UIKit

extension UIViewController{
    static func instantiate<T>() -> T{
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
}
