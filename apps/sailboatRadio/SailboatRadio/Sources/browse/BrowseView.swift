//
//  BrowseView.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import SwiftUI
import SailboatMedia

struct BrowseView: View {
    
    private let player = SailboatRadioPlayer()
    
    var body: some View {
        player.view
    }
    
}
