//
//  UpdateList.swift
//  GameNews
//
//  Created by Fran Jukic on 31/03/2020.
//  Copyright © 2020 Fran Jukic. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(color: Color("color2"), title: "React Native for Designers", text: "Build your own iOS and Android app with custom animations, Redux and API data.", date: "FEB 14"))
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.updates.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack {
                            Color(update.color)
                                .frame(width: 80, height: 80)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color("secondary"))
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove(perform: move)
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(
                leading: Button(action: addUpdate) { Text("Add Update") },
                trailing: EditButton()
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var color: Color
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(color: Color("color2"), title: "SwiftUI Advanced", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "JAN 1"),
    Update(color: Color("color3"), title: "Webflow", text: "Design and animate a high converting landing page with advanced interactions, payments and CMS", date: "OCT 17"),
    Update(color: Color("color4"), title: "ProtoPie", text: "Quickly prototype advanced animations and interactions for mobile and Web.", date: "AUG 27"),
    Update(color: Color("color5"), title: "SwiftUI", text: "Learn how to code custom UIs, animations, gestures and components in Xcode 11", date: "JUNE 26"),
    Update(color: Color("accent"), title: "Framer Playground", text: "Create powerful animations and interactions with the Framer X code editor", date: "JUN 11")
]
