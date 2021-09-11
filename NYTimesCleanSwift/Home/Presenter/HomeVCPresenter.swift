//
//  HomeVCPresenter.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

protocol HomeVCPresentable {
    func presentArticleList(articles: [ArcticleDetails])
    func presentAlert()
}

final class HomeVCPresenter {
    
    weak var viewController: HomeVCDisplayable?
    
    init(withController controller: HomeVCDisplayable) {
        self.viewController = controller
    }
    
}

extension HomeVCPresenter: HomeVCPresentable {
   
    func presentArticleList(articles: [ArcticleDetails]) {
        viewController?.displayArticles(articles: articles)
        viewController?.hideProgressHud()
    }
   
    func presentAlert() {
        viewController?.hideProgressHud()
        viewController?.showAlert()
    }
    
}
