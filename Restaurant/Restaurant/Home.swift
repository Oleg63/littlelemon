//
//  Home.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-08-31.
//

import SwiftUI
import CoreData

struct Home: View {
    let persistence = PersistenceController.shared
    
    var body: some View {
                
        TabView {
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem({
                    Label("Menu", systemImage: "list.dash")
                })
            UserProfile()
                .tabItem({
                    Label("Profile", systemImage: "square.and.pencil")
                })
        }
        .navigationBarBackButtonHidden(true) //hide "back" button
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
