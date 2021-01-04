//
//  StationImageView.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/3/21.
//

import SwiftUI

struct StationImageView: View {
    
    private struct Constants {
        static let size: CGFloat = 70
    }
    
    weak var delegate: ButtonDelegate?
    
    @State
    var imageName = ""
    
    var body: some View {
        Image(imageName)
            .resizable()
            .background(Color.red)
            .frame(width: Constants.size, height: Constants.size)
    }
    
}
