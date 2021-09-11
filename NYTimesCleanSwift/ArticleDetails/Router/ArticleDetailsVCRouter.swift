//
//  ArticleDetailsVCRouter.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

protocol ArticleDetailsVCRoutable {
    func routeToHomeViewController()
}

final class ArticleDetailsVCRouter {
    
    private weak var viewController: ArticleDetailViewController?
   
    init(withViewController controller: ArticleDetailViewController) {
        self.viewController = controller
    }
    
}

extension ArticleDetailsVCRouter: ArticleDetailsVCRoutable {
    func routeToHomeViewController() {
        
    }
    
}
