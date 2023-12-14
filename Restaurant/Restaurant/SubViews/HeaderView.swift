//
//  HeaderView.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-11-13.
//

import SwiftUI

struct HeaderView: View {
    let showAvatar: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Spacer()
            if showAvatar {
                Image("Profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 52, height: 52)
            }
        }
        .padding()
        .frame(height: 52)
    }
}

#Preview {
    HeaderView(showAvatar: true)
}
