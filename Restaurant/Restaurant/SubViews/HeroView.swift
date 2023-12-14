//
//  HeroView.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-11-13.
//

import SwiftUI

struct HeroView: View {
    @Binding var searchText: String
    var showSearch = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Little Lemon")
                .foregroundColor(Color.primaryYellow)
                .font(.custom("Markazi Text", size: 42))
            Text("Chicago")
                .foregroundColor(.white)
                .font(.custom("Markazi Text", size: 32))
                .padding(.bottom, -90)
            HStack {
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .foregroundColor(.white)
                    .font(.custom("Karla", size: 16))
                Image("HeroImage")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }
            
            if showSearch {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding([.leading], 5)
                    
                    TextField("Search menu", text: $searchText)
                        .padding(8)
                }
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            }
        }
        .padding()
        .background(Color.primaryGreen)
    }
        

}

#Preview {
    HeroView(searchText: .constant(""))
}
