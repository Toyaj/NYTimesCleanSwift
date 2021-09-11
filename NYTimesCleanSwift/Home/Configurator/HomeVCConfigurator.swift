//
//  HomeVCConfigurator.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

struct HomeVCConfigurator {
    
    func configure(withController controller: HomeViewController) {
        
        let presenter = HomeVCPresenter(withController: controller)
        let interactor = HomeVCInteractor(withPresenter: presenter)
        controller.interactor = interactor
        let router = HomeVCRouter(withViewController: controller)
        controller.router = router
        
    }
}
