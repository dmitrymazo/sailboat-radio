//
//  ArrayBuilder.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import Foundation

struct ArrayBuilder {
    
    static func getMatrix<T>(from array: [T], numberOfColumns: Int) -> [[T]] {
        guard numberOfColumns != 0 else { return [[]] }
        
        var i = 0
        var newArray = [[T]]()
        let numberOfRows = Int(ceil(Double(array.count)/Double(numberOfColumns)))
        
        for _ in 0..<numberOfRows {
            var row = [T]()
            for _ in 0..<numberOfColumns {
                guard i < array.count else { continue }
                row.append(array[i])
                i += 1
            }
            newArray.append(row)
        }
        
        return newArray
    }
    
}
