//
//  DesafioRouter.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import UIKit
import Foundation

public protocol ScenePresenter: class {
    func present(viewController: UIViewController)
}

public class DesafioRouter: NSObject {
    
    public static let shared: DesafioRouter = DesafioRouter()
    
    public override init() {
        
    }
    
    func initLoginRoot() -> UINavigationController{
        let viewController = LoginViewController.storyboardInstance
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        presenter.interactor = interactor
        presenter.routing = self
        viewController.presenter = presenter
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func initHomeRoot() -> UINavigationController{
        let viewController = HomeViewController.storyboardInstance
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        presenter.interactor = interactor
        presenter.routing = self
        viewController.presenter = presenter
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func goToSendMessage() {
        let viewController = SendMessageViewController.storyboardInstance
        let interactor = SendMessageInteractor()
        let presenter = SendMessagePresenter()
        presenter.interactor = interactor
        presenter.routing = self
        viewController.presenter = presenter
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToVericationMessage() {
        let viewController = VerificationMessageViewController.storyboardInstance
        let interactor = VerficationMessageInteractor()
        let presenter = VerificationMessagePresenter()
        presenter.interactor = interactor
        presenter.routing = self
        viewController.presenter = presenter
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToAddPerson() {
        let viewController = AddPersonViewController.storyboardInstance
        let interactor = AddPersonInteractor()
        let presenter = AddPersonPresenter(interactor: interactor)
        presenter.routing = self
        viewController.presenter = presenter
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToListPersons() {
        let viewController = ListPersonViewController.storyboardInstance
        let interactor = ListPersonInteractor()
        let presenter = ListPersonPersenter()
        presenter.interactor = interactor
        presenter.routing = self
        viewController.presenter = presenter
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToDetailPeople(people: results) {
        let viewController = DetailPeopleViewController.storyboardInstance
        let interactor = DetailPeopleInteractor()
        let presenter = DetailPeoplePresenter()
        presenter.interactor = interactor
        presenter.routing = self
        viewController.presenter = presenter
        viewController.people = people
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToHome() {
        let viewController = HomeViewController.storyboardInstance
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        presenter.interactor = interactor
        presenter.routing = self
        viewController.presenter = presenter
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
