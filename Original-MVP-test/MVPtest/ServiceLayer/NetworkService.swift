//
//  NetworkService.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 18.06.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import Foundation


//MARK: - NetworkServiceProtocol
protocol NetworkServiceProtocol {
    
    func getComments(completion: @escaping (Result<[Model]?, Error>) -> Void)
    
}

//MARK: - NetworkService
class NetworkService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Model]?, Error>) -> Void) {
        
        let urlString = "https://peretz-group.ru/api/v2/products?category=93&key=47be9031474183ea92958d5e255d888e47bdad44afd5d7b7201d0eb572be5278"
        guard let url = URL(string: urlString) else { return }
        
        //MARK: - URLSession
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([Model].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
