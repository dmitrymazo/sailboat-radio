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
    
    @ObservedObject
    var model: TitleModel
    
    var body: some View {
        VStack {
            Text("\(model.title)")
                .frame(maxWidth: 200, maxHeight: 50)
            Text("\(model.descr)")
                .frame(maxWidth: 200, maxHeight: 50)
        }
    }
    
}

final class TitleModel: ObservableObject {
    @Published
    var title = ""
    
    @Published
    var descr = ""
}
