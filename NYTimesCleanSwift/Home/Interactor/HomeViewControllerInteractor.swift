//
//  HomeViewControllerInteractor.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

protocol HomeViewControllerInteractable {
    func getArticles()
}

final class HomeViewControllerInteractor {
    
    let presenter: HomeViewControllerPresentable
    private let worker = HomeViewConrollerWorker()
    
    init(withPresenter presenter: HomeViewControllerPresentable) {
        self.presenter = presenter
    }
}


extension HomeViewControllerInteractor: HomeViewControllerInteractable {
   
    func getArticles() {
        
        worker.getArticles { result in
            switch result {
            case .success(let articleDetails):
                self.presenter.presentArticleList(articles: articleDetails)
            case .failure(_):
                self.presenter.presentAlert()
            }
        }
    }
}
