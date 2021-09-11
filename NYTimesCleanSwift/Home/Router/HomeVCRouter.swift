//
//  HomeViewControllerRouter.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

protocol HomeViewControllerRoutable {
    func routeToAtticleDetailsViewController(articleDetails: ArcticleDetails)
}

final class HomeVCRouter {
    
    private weak var viewController: HomeViewController?
    
    init(withViewController controller: HomeViewController) {
        self.viewController = controller
    }
}

extension HomeVCRouter: HomeViewControllerRoutable {
   
    func routeToAtticleDetailsViewController(articleDetails: ArcticleDetails) {
        
        guard let articleDetailsVC = viewController?.storyboard?.instantiateViewController(withIdentifier: Constant.ViewControllerTitle.articleDetailViewControllerIdentifier.rawValue) as? ArticleDetailViewController else { return }
        articleDetailsVC.mdlView.model = articleDetails
        viewController?.navigationController?.pushViewController(articleDetailsVC, animated: true)
        
    }
    
}
