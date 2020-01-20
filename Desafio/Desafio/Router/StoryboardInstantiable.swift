//
//  StoryboardInstantiable.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import UIKit
import Foundation

protocol StoryboardInstantiable {
    static var storyboardId: String {get}
    static var storyboardName: String {get}
}

extension StoryboardInstantiable where Self:UIViewController {
    static var storyboardInstance: Self {
        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardId)
        return viewController as! Self
    }
    
    static var storyboardId: String {
        return NSStringFromClass(self).components(separatedBy: (".")).last!
    }
}
