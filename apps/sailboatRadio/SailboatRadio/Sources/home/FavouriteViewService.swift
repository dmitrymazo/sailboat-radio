//
//  FavouriteViewService.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import Foundation

final class FavouriteViewService: RadioStationViewService {
    init() {
        super.init(service: FavouriteStationService())
    }
}
