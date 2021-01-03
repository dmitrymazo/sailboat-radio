//
//  TitleView.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/3/21.
//

import SwiftUI

struct TitleView: View {
    
    private struct Constants {
        static let size: CGFloat = 40
    }
    
    @State
    var title: String = "vewwthwh"
    
    var body: some View {
        Text("\(title)")
            .frame(maxWidth: 200, maxHeight: 50)
    }
    
}
