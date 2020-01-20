//
//  NetworkRequester.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import Foundation

typealias DataResponse = (Data?, NetworkError?) -> Void

class NetworkRequester: NSObject {
    
    /// Request Generic data from server
    ///
    /// - Parameters:
    ///   - request: Request Protocol
    ///   - completion: Generic or Error
    public func performRequest<T: Decodable>(_ request: RequestProtocol,
                                                    completion: @escaping (T?, NetworkError?) -> Void) {
        performRequest(request) { (data, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NetworkError.unknown("No error from server and data is nil."))
                return
            }
            
            do {
                let generic = try JSONDecoder().decode(T.self, from: data)
                completion(generic, nil)
            } catch {
                completion(nil, NetworkError.parse(error.localizedDescription))
            }
        }
    }
    
    /// Fetch data from URL with NSUrlSession
    ///
    /// - Parameters:
    ///   - request: Parameters for request
    ///   - completion: Returns fetched NSData in a block
    /// - Returns: URLSessionDataTask
    func performRequest(_ request: RequestProtocol,
                        completion: @escaping DataResponse) {
        guard let urlRequest = request.urlRequest else {
            return
        }
        
        performRequest(urlRequest, completion: completion)
        
    }
    
    /// Fetch data from URL with NSUrlSession
    ///
    /// - Parameters:
    ///   - urlRequest: Url Request to fetch data form
    ///   - completion: Returns fetched NSData in a block
    /// - Returns: URLSessionDataTask
    private func performRequest(_ urlRequest: URLRequest,
                        completion: @escaping DataResponse) {
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                print("There was an error \(error.localizedDescription)")
                
                let urlError = error as NSError
                if urlError.code == NSURLErrorTimedOut {
                    completion(nil, NetworkError.timeOut(error.localizedDescription))
                } else if urlError.code == NSURLErrorNotConnectedToInternet {
                    completion(nil, NetworkError.noConnection(error.localizedDescription))
                } else if urlError.code == URLError.cancelled.rawValue {
                    completion(nil, NetworkError.cancelled(error.localizedDescription))
                } else {
                    completion(nil, NetworkError.unknown(error.localizedDescription))
                }
            } else {
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 401  {
                    completion(nil, NetworkError.unauthorized)
                } else {
                    completion(data, nil)
                }
            }
        }
        dataTask.resume()
    }
}
