//
//  SailboatComponent.swift
//  SailboatMedia
//
//  Created by Dmitry Mazo on 1/3/21.
//

import SwiftUI

protocol SailboatComponent: AnyObject {
    var player: RadioPlayer? { get set }
}

protocol SailboatVisualComponent: SailboatComponent {
    var view: AnyView? { get }
}
