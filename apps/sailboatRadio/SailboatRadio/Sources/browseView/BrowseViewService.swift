//
//  FavouriteViewService.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import Foundation

final class BrowseViewService: RadioStationViewService {
    init() {
        super.init(service: BrowseStationService())
    }
}
