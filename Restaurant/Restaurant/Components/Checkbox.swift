//
//  Checkbox.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-11-28.
//

import SwiftUI

struct ToggleCheckboxStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .symbolVariant(.fill)
        }
        .tint(Color.primaryGreen)
    }
}
