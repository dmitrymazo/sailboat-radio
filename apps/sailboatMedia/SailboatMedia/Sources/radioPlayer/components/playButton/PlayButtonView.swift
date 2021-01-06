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
    
    @ObservedObject
    var model: PlayButtonModel
    
    var presenter: ButtonDelegate
    
    var body: some View {
        if let imageName = model.imageName {
            Image(imageName, bundle: Bundle(for: SailboatMedia.self))
                .resizable()
                .frame(width: Constants.size, height: Constants.size)
                .onTapGesture {
                    presenter.tapped()
                }
        }
    }
    
}

protocol ButtonDelegate: AnyObject {
    func tapped()
}

final class PlayButtonModel: ObservableObject {
    @Published
    var imageName: String? = nil
}
