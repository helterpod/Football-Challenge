//
//  iOSCheckboxToggleStyle.swift
//  Football Challenge
//
//  Created by Adrian Talbot on 18/08/2024.
//

import Foundation
import SwiftUI

// Courtesy of https://sarunw.com/posts/swiftui-checkbox/

struct iOSCheckboxToggleStyle : ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
    }
}
