//
//  HomeViewControllerRouter.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

protocol HomeViewControllerRoutable {
    func routeToAtticleDetailViewController(articleDetails: ArcticleDetails)
}

final class HomeViewControllerRouter {
    
    private weak var viewController: HomeViewController?
    
    init(withViewController controller: HomeViewController) {
        self.viewController = controller
    }
}

extension HomeViewControllerRouter: HomeViewControllerRoutable {
   
    func routeToAtticleDetailViewController(articleDetails: ArcticleDetails) {
        
        guard let articleDetailsVC = viewController?.storyboard?.instantiateViewController(withIdentifier: Constant.ViewControllerTitle.articleDetailViewControllerIdentifier.rawValue) as? ArticleDetailViewController else { return }
        articleDetailsVC.mdlView.model = articleDetails
        viewController?.navigationController?.pushViewController(articleDetailsVC, animated: true)
        
    }
    
}
