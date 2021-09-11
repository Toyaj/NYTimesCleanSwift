//
//  ArticleDetailsConfigurator.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

struct ArticleDetailsConfigurator {
    
    func configure(withController controller: ArticleDetailViewController) {
        
        let presenter = ArticleDetailsVCPresenter(withController: controller)
        let interactor = ArticleDetailsVCInteractor(withPresenter: presenter)
        controller.interactor = interactor
        let router = ArticleDetailsVCRouter(withViewController: controller)
        controller.router = router
        
    }
}
