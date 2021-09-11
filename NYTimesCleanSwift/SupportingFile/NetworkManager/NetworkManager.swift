//
//  NetworkManager.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//

import Foundation

class NetworkManager {
    
    // MARK: - API Call
    
    func getNYArticles(completionHandler: @escaping (Result<[ArcticleDetails], Error>) -> Void) {
        
        let articleUrl = "\(ServiceApi.url)\(Bundle.main.object(forInfoDictionaryKey: "NYTimesAppKey") ?? "")"
        guard let url = URL(string: articleUrl)  else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                completionHandler(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                debugPrint("Error with the response, unexpected status code: \(response.debugDescription)")
                completionHandler(.failure(error as! Error))
                return
            }
            
            if let data = data,
               let articleModel = try? JSONDecoder().decode(NYArticleModel.self, from: data) {
                completionHandler(.success(articleModel.results))
            }
        })
        task.resume()
    }
}

