//
//  NetworkServiceOne.swift
//  URLSessionProject
//
//  Created by WEMA on 16/01/2024.
//

import Foundation

// Old style of Network call

struct NetworkServiceOne{
    let session = URLSession.shared
    func fetch(url: URL, completionHandler: @escaping(Result<PhoneModel?, Error>) -> Void){
        session.dataTask(with: url) { data, URLResponse, error in
            if let error {
                completionHandler(.failure(error))
            }
            
            if let data {
                let jsonDecoder = JSONDecoder()
                let phoneModel = try? jsonDecoder.decode(PhoneModel.self, from: data)
                completionHandler(.success(phoneModel))
            }
        }.resume()
    }
}
