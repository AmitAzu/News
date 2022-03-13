//
//  ApiService.swift
//  News
//
//  Created by Amit on 13/03/2022.
//

import UIKit

class APIService :  NSObject {
    
    static let shared = APIService()
    private var dataTask: URLSessionDataTask?
    
    func apiToGetData<T: Codable>(completion : @escaping Completion<T>){
        
        let endPoint = "https://newsapi.org/v2/everything?q=tesla&from=2022-02-13&sortBy=publishedAt&apiKey=60a09c3c72d5428e938e9cc61a4c2f0a"
        guard let url = URL(string: endPoint) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(T.self, from: data)
                        completion(response)
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }.resume()
    }
}
