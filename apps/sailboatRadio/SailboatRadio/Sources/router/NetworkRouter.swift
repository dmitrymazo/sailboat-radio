//
//  NetworkRouter.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/9/21.
//  Copyright © 2021 Sailboat Technologies, Inc. All rights reserved.
//

import Foundation

final class NetworkRouter: Router {
    private var task: URLSessionDataTask?
    
    func create(for url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
        }
    }
    
    func resume() {
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
}

protocol Router {
    func create(for url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
    func resume()
    func cancel()
}
