//
//  LoaderActivity.swift
//  Calida
//
//  Created by Danny Alva on 1/14/20.
//  Copyright © 2020 danny. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoaderActivity {
    
    var activityView: NVActivityIndicatorView!
    var view: UIView!
    
    static let shared: LoaderActivity = {
        let instance = LoaderActivity()
        return instance
    }()
    
    private init() {
        
    }
    
    func showActivity() {
        if (view != nil) {
            removeActivity()
        }
        
        view = UIView(frame: UIScreen.main.bounds)
        
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityView = NVActivityIndicatorView(frame: rect, type: .ballPulse, color: .blue, padding: 20.0)
        activityView.center = view.center
        
        UIApplication.topViewController()?.view.addSubview(activityView)
        activityView.startAnimating()
        
    }
    
    func removeActivity() {
        activityView.stopAnimating()
        activityView.removeFromSuperview()
        view.removeFromSuperview()
    }

}
