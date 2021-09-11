//
//  ArticleDetailsVCPresenter.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

protocol ArticleDetailsVCPresentable {
    func presentArtist()
}

final class ArticleDetailsVCPresenter {
    
    weak var viewController: ArticleDetailViewControllerDisplayable?
    
    init(withController controller: ArticleDetailViewControllerDisplayable) {
        self.viewController = controller
    }
    
}

extension ArticleDetailsVCPresenter: ArticleDetailsVCPresentable {
   
    func presentArtist() {
        viewController?.displayArticles()
    }
    
}
