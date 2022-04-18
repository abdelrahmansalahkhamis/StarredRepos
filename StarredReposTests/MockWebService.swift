//
//  MockWebService.swift
//  StarredReposTests
//
//  Created by abdrahman on 17/04/2022.
//

import Foundation
@testable import StarredRepos

class MockWebService: RepoServiceProtocol{
    
    
    func load<T>(resource: Resource<T>?, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable, T : Encodable {
        guard let resource = resource else {
            return
        }
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("en-US,en;q=0.5", forHTTPHeaderField: "Accept-Language")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.urlError))
                return
            }
            do{
                let result = try? JSONDecoder().decode(T.self, from: data)
                if let result = result {
                    completion(.success(result))
                }else{
                    completion(.failure(.decodingError))
                }
            }catch(let error){
                completion(.failure(.decodingError))
            }
        }.resume()
        
    }
    
}
