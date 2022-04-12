//
//  WebService.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import Foundation

protocol RepoServiceProtocol {
    func load<T>(resource: Resource<T>, completion: @escaping(Result<T, NetworkError>) -> Void)
}


class WebService: RepoServiceProtocol{
    func load<T> (resource: Resource<T>, completion: @escaping(Result<T, NetworkError>) -> Void){
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.urlError))
                print(error?.localizedDescription)
                return
            }
            
            print("data loaded are => \(data)")
            do{
                let result = try? JSONDecoder().decode(T.self, from: data)
                print("results are :- \(result)")
                if let result = result {
                    print("result are :- \(result)")
                    DispatchQueue.main.async {
                        completion(.success(result))
                        //print("yes")
                    }
                }else{
                    completion(.failure(.decodingError))
                }
            }catch(let error){
                completion(.failure(.decodingError))
                print("error is ==> \(error)")
            }
        }.resume()
    }
}
