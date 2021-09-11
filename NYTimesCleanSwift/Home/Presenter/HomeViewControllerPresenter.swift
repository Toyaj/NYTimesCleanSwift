//
//  HomeViewControllerPresenter.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

protocol HomeViewControllerPresentable {
    func presentArticleList(articles: [ArcticleDetails])
    func presentAlert()
}

final class HomeViewControllerPresenter {
    
    weak var viewController: HomeViewControllerDisplayable?
    
    init(withController controller: HomeViewControllerDisplayable) {
        self.viewController = controller
    }
    
}

extension HomeViewControllerPresenter: HomeViewControllerPresentable {
   
    func presentArticleList(articles: [ArcticleDetails]) {
        viewController?.displayArticles(articles: articles)
        viewController?.hideProgressHud()
    }
   
    func presentAlert() {
        viewController?.hideProgressHud()
        viewController?.showAlert()
    }
    
}
