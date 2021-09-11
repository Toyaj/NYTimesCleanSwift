//
//  HomeViewController+TableView.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource {
   
    // MARK: - UITableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.totalArticleCount
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.TableViewCellIdentifier.article.rawValue, for: indexPath) as! ArticleTableViewCell
        cell.viewModel.model = viewModel.getArticleDetail(item: indexPath.row)
        cell.prepareForCell()
        return cell
        
    }
}

extension HomeViewController: UITableViewDelegate {
    
    // MARK: - UITableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let articleDetails = viewModel.getArticleDetail(item: indexPath.row) else {
            return
        }
        router?.routeToAtticleDetailsViewController(articleDetails: articleDetails)
    }
    
}
