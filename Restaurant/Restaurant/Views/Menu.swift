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
    
    @State private var isMenuLoaded = false
    @State private var searchText = ""
    @State private var showedCategory: MenuCategory = .all
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(showAvatar: true)
                HeroView(searchText: $searchText, showSearch: true)
                MenuBreakdown(category: $showedCategory)
                                
                //Menu items
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    List() {
                        ForEach(dishes, id: \.id)
                        {
                            dish in
                            MenuItemView(dish: dish)
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
                        newDish.details = dish.details
                        newDish.category = dish.category
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
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))
        ]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
