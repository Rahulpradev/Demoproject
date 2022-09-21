//
//  APIServiceManager.swift
//  Demoproject
//
//  Created by R, Rahul Pradev on 20/09/22.
//

import Foundation

struct APIResponse<D : Decodable>: Decodable {
    
    let data: D

}


class APIManager {
    
    typealias APIServiceCallback<A> = (A?, Error?) -> Void
    
    typealias ResultBlock<T> = (Result <T, Error>) -> Void

    // MARK: - Vars & Lets
    
    
    static var sharedApiManager: APIManager = {
        let instance = APIManager()
        return instance
    }()
    
    class func shared() -> APIManager {
        return sharedApiManager
    }
    
    private init() {}
    
    
    func load<T : Decodable>(urlRequest: URLRequest, type: T.Type, withCompletion completion: @escaping (APIResponse<T>?,Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error { completion(nil, error); return }
            do {
                let response = try JSONDecoder().decode(APIResponse<T>.self, from: data!)
                DispatchQueue.main.async { completion(response, nil) }
            } catch {
                DispatchQueue.main.async { completion(nil, error) }
            }
        }
        task.resume()
    }
    
    func apiRequest<T : Decodable>(urlRequest: URLRequest, type: T.Type, withCompletion completion: @escaping ResultBlock<T>) {
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error { completion(.failure(error)); return }
            do {
                let response: T = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}




