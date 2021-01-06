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
    
    @ObservedObject
    var model: StationImageModel
    
    var body: some View {
        Image(model.imageName, bundle: Bundle(for: SailboatMedia.self))
            .resizable()
            .background(Color.red)
            .frame(width: Constants.size, height: Constants.size)
    }
    
}

final class StationImageModel: ObservableObject {
    @Published
    var imageName = ""
    
    init(imageName: String) {
        self.imageName = imageName
    }
}
