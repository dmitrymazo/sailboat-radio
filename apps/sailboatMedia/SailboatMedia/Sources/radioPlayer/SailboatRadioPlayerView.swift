//
//  RadioPlayerView.swift
//  SailboatRadio
//
//  Created by Dmitry Mazo on 1/2/21.
//

import SwiftUI

public struct SailboatRadioPlayerView: View {
    
    private struct Constants {
        static let width: CGFloat = 90
        static let opacity = 0.2
    }
    
    let color: Color
    let components: [AnyView]
    
    private var mainView: some View {
        HStack {
            ForEach(0..<components.count) { index in
                components[index]
            }
        }
    }
    
    public var body: some View {
        mainView
            .frame(maxWidth: .infinity, maxHeight: Constants.width)
            .background(color.opacity(Constants.opacity))
    }
    
}
