//
//  MenuItemView.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-11-05.
//

import SwiftUI

struct MenuItemView: View {
    let dish:Dish
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(dish.title!)")
                .bold()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(dish.details ?? "")")
                        .font(.footnote)
                        .foregroundColor(Color.primaryGreen)
                        .lineLimit(2)
                        .padding(.bottom, 3)
                    Text("$\(dish.price!)")
                        .foregroundColor(Color.primaryGreen)
                }
                Spacer(minLength: 20)
                AsyncImage(url: URL(string: dish.image!)) { image in
                    image
                        .resizable()
                        .frame(width: 50, height: 50)
                        
                } placeholder: {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
}

//#Preview {
//    MenuItemView(dish: PersistenceController.self)
//}
