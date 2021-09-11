//
//  HomeViewControllerConfigurator.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

struct HomeViewControllerConfigurator {
    
    func configure(withController controller: HomeViewController) {
        
        let presenter = HomeViewControllerPresenter(withController: controller)
        let interactor = HomeViewControllerInteractor(withPresenter: presenter)
        controller.interactor = interactor
        let router = HomeViewControllerRouter(withViewController: controller)
        controller.router = router
        
    }
}
