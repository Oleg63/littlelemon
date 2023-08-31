//
//  Menu.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-08-31.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        
        VStack{
            //Title
            Text("Little Lemon Restaurant.")
            //Restautrant location
            Text("Chicago")
            //App description, what it does.
            Text("The app does the food ordering and delivery.")
            
            //Menu items
            //List{
            //}
        }
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
