//
//  DataService.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import Foundation

protocol RadioStationService {
    func getList(offset: Int, searchValue: String?, completion: @escaping ([RadioStation]) -> Void)
}
