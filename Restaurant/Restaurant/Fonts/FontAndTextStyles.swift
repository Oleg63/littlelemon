//
//  FontAndTextStyles.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-12-03.
//

import SwiftUI

extension Text {
    func titleTextStyle() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.primaryGreen)
            .font(.custom("Karla Bold", size: 13))
    }
}
