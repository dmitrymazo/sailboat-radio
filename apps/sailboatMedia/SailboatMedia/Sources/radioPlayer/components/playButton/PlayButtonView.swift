//
//  PlayButtonView.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/3/21.
//

import SwiftUI

struct PlayButtonView: View {
    
    private struct Constants {
        static let size: CGFloat = 50
    }
    
    weak var delegate: ButtonDelegate?
    
    @State
    var imageName = ""
    
    var body: some View {
        Image(imageName, bundle: Bundle(for: SailboatMedia.self))
            .resizable()
            .frame(width: Constants.size, height: Constants.size)
            .onTapGesture {
                delegate?.tapped()
            }
    }
    
}

protocol ButtonDelegate: AnyObject {
    func tapped()
}
