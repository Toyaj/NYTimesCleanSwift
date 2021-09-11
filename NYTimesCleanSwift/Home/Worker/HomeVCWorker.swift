//
//  HomeVCWorker.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import Foundation

struct HomeVCWorker {
    
    let networkManager: NetworkManager = NetworkManager()
    
    func getArticles(completionHandler: @escaping (Result<[ArcticleDetails], Error>) -> Void) {
        
        networkManager.getNYArticles { result in
            switch result {
            case .success(let arcticleDetails):
                completionHandler(.success(arcticleDetails))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
