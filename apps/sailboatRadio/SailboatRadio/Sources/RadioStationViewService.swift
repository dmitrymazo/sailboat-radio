//
//  RadioStationViewService.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/3/21.
//  Copyright © 2021 SailboatDevelopment, Inc. All rights reserved.
//

import SwiftUI

open class RadioStationViewService: ObservableObject {
    
    private var service: RadioStationService
    
    @Published
    private(set) var isLoaded = false
    
    @Published
    private(set) var stations = [RadioStation]()
    
    func load() {
        service.getList { stations in
            self.stations = stations
            isLoaded = true
        }
    }
    
    init(service: RadioStationService) {
        self.service = service
    }
}
