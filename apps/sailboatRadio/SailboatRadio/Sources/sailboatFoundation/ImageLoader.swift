//
//  ImageLoader.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class ImageLoader: ObservableObject {
    
    @Published
    private(set) var isLoaded = false
    
    @Published
    private(set) var image: UIImage?
    
    private var task: URLSessionDataTask?
    
    func load(url: URL) throws {
        
        self.task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let data = data
                  , error == nil else {
                return
            }
            
            DispatchQueue.main.async {                
                self?.isLoaded = true
                self?.image = UIImage(data: data)
            }
        }
        
        self.task?.resume()
    }
    
    func cancelRequest() {
        // TO DO: not called now!!!!!!!!!!
        self.task?.cancel()
    }
    
}
