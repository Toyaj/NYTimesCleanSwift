//
//  ArticleDetailsVCInteractor.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

protocol ArticleDetailsVCInteractable {
    func showArticle()
}

final class ArticleDetailsVCInteractor {
    
    let presenter: ArticleDetailsVCPresentable
    
    init(withPresenter presenter: ArticleDetailsVCPresentable) {
        self.presenter = presenter
    }
}

extension ArticleDetailsVCInteractor: ArticleDetailsVCInteractable {
  
    func showArticle() {
        presenter.presentArtist()
    }
    
}
