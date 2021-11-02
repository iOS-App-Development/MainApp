//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import RouterLibrary
import ShopModule
import CoordinatorLibrary
import Foundation
import UIKit
import AccountModule

class MainCoordinator : BaseCoordinator  {
    
    deinit {
        print("deinit for MainCoordinator")
    }

}

extension MainCoordinator  // Coordinator remaining function overriding
{
    override func start() {
//        self.navigationController?.delegate = self
        let vc = ViewController.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: false)
    }
    
}

extension MainCoordinator:MainModuleCoordinator
{
    func openShopModule() {
        let child = ShopCoordinatorImpl(navigationController: navigationController,flowListener: self)
        dependencies?.add(dependency: child)
        child.start()
    }
    
    func openAccountModule() {
        let child = AccountCoordinatorImpl(navigationController: navigationController,flowListener: self)
        dependencies?.add(dependency: child)
        child.start()
    }
}

//extension MainCoordinator : UINavigationControllerDelegate {
//
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        // Read the view controller we’re moving from.
//        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
//            return
//        }
//
//        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
//        if navigationController.viewControllers.contains(fromViewController) {
//            return
//        }
//
//        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
//
//        if let buyViewController = fromViewController as? ModuleStartPoint {
//            // We're popping a buy view controller; end its coordinator
////            childDidFinish(buyViewController.coordinator)
//        }
//    }
//}


//If you want to communicate between parent and child coordinate then implement this protocol
extension MainCoordinator: CoordinatorFlowListener {
    func onFlowFinished(coordinator: Coordinator) {
        // all these below implemnetation available in base coordinator via Router Protocol
        dependencies?.remove(dependency: coordinator)
//        self.popToRootModule(animated: false)
    }
}
