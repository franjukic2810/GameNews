//
//  TabBar.swift
//  GameNews
//
//  Created by Fran Jukic on 03/04/2020.
//  Copyright © 2020 Fran Jukic. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            ContentView().tabItem {
                Image(systemName: "play.circle.fill")
                .font(.system(size: 20))
                Text("Home")
                .font(.system(size: 20))
            }
            CourseList().tabItem {
                Image(systemName: "gamecontroller")
                    .font(.system(size: 20))
                Text("Games")
                .font(.system(size: 20))
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar().environment(\.colorScheme,.dark)
    }
}
