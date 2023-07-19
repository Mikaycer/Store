//
//  ApiManager.swift
//  StoreApp
//

import Foundation

final class ApiManager {
    func request<T: Codable>(modelType: T.Type, endpoint:String, method: String, headers: [String: String]? = nil, body: Data? = nil, token: String? = nil, completion: @escaping(Result<T, Error>) -> Void) {
        guard let url = URL(string: "https://api.escuelajs.co/\(endpoint)") else { return }
//    https://reqres.in/
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        if let body = body {
            request.httpBody = body
        }
        if let token = token {
            print("TOKEN ACCESS \(token)")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        print(url)
//        print(request.httpBody)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print("response: \(response)")
            }
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            do{
                let serverData = try JSONDecoder().decode(modelType, from: data)
                completion(.success(serverData))
            }catch let error as NSError{
                completion(.failure(error))
            }
        }.resume()
    }
    
    func requestOth<T: Codable>(endpoint: String, modelType: T.Type, method: String, body: Data? = nil, completion: @escaping(Result<T, Error>) -> Void) {
        guard let url = URL(string: "https://reqres.in/\(endpoint)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
//        if let headers = headers {
//            for (key, value) in headers {
//                request.setValue(value, forHTTPHeaderField: key)
//            }
//        }
        if let body = body {
            request.httpBody = body
        }
//        if let token = token {
//            print("TOKEN ACCESS \(token)")
//            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        }
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        print(url)
//        print(request.httpBody)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print("response: \(response)")
            }
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            do{
                let serverData = try JSONDecoder().decode(modelType, from: data)
                completion(.success(serverData))
            }catch let error as NSError{
                completion(.failure(error))
            }
        }.resume()
    }
    
    func requestOther<T: Codable>(endpoint: String, modelType: T.Type, method: String, body: Data? = nil, completion: @escaping(Result<T, Error>) -> Void) {
        guard let url = URL(string: "https://reqres.in/\(endpoint)") else { return }
        print(url)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error {
//                    failure(error)
                    completion(.failure(error))
                }
                return
            }
            do{
                let serverData = try JSONDecoder().decode(T.self, from: data)
//                completion(serverData)
                completion(.success(serverData))
            }catch {
//                failure(error)
                completion(.failure(error))
            }
        }.resume()
    }
}
