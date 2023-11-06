//
//  Menu.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-08-31.
//

import SwiftUI
import CoreData
import Foundation

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var isMenuLoaded = false
    
    var body: some View {
        NavigationView {
            VStack{
                //Title
                Text("Little Lemon")
                //Restautrant location
                Text("Chicago")
                //App description, what it does.
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                
                //Menu items
                FetchedObjects() {
                    (dishes: [Dish]) in
                    List() {
                        ForEach(dishes, id: \.id)
                        {
                            dish in
                            HStack{
                                Text("\(dish.title!)")
                                    .bold()
                                Spacer()
                                Text("$\(dish.price!)")
                                
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
                    .listStyle(.plain)
                }
            }
        }.onAppear {
            if !isMenuLoaded {
                getMenuData()
                isMenuLoaded = true
            }
        }
        
    }

    func getMenuData(){
        PersistenceController.shared.clear() //clear the database
        
        let url: String = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let menuURL = URL(string: url)!
        let request = URLRequest(url: menuURL)
        let task = URLSession.shared.dataTask(with: request)
        { data, responce, error in
            if let data = data,
               let responceString = String(data: data, encoding: .utf8){
                print(responceString)
                let jsonData = Data(responceString.utf8)
                let decoder = JSONDecoder()
                if let allMenu = try? decoder.decode(MenuList.self, from: jsonData){
                    for dish in allMenu.menu {
                        let newDish = Dish(context: viewContext)
                        newDish.title = dish.title
                        newDish.image = dish.image
                        newDish.price = dish.price
                    }
                    try? viewContext.save() //save the data into the database
                } else {
                    print(error.debugDescription.description)
                }
            } else {
                print(error.debugDescription.description)
            }
        }
        task.resume()
    }
    
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
