//
//  MenuBreakdown.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-11-13.
//

import SwiftUI

struct MenuBreakdown: View {
    @Binding var category: MenuCategory
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ORDER FOR DELIVERY!")
                .font(.custom("Karla ExtraBold", size: 16))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(MenuCategory.allCases, id: \.rawValue) { category in
                        Button {
                            self.category = category
                        } label: {
                            Text("\(category.rawValue)")
                                .font(.custom("Karla Bold", size: 16))
                                .bold()
                                .padding(EdgeInsets(top: 9, leading: 0, bottom: 9, trailing: 0))
                                .padding(.horizontal)
                                .foregroundColor(Color.primaryGreen)
                                .background(Color.highlightGreyLight)
                                .clipShape(Capsule())
                                .lineLimit(1)
                        }
                    }
                }
                
            }
        }
        .padding(.horizontal, 5)
        
    }
}

#Preview {
    MenuBreakdown(category: .constant(.all))
}
