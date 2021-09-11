//
//  HomeVCInteractor.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

protocol HomeVCInteractable {
    func getArticles()
}

final class HomeVCInteractor {
    
    let presenter: HomeVCPresentable
    private let homeVCWorker = HomeVCWorker()
    
    init(withPresenter presenter: HomeVCPresentable) {
        self.presenter = presenter
    }
}


extension HomeVCInteractor: HomeVCInteractable {
    
    func getArticles() {
        
        homeVCWorker.getArticles { result in
            switch result {
            case .success(let articleDetails):
                self.presenter.presentArticleList(articles: articleDetails)
            case .failure(_):
                self.presenter.presentAlert()
            }
        }
    }
}
