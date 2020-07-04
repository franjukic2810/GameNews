//
//  ContentView.swift
//  GameNews
//
//  Created by Fran Jukic on 29/03/2020.
//  Copyright © 2020 Fran Jukic. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            Home().tabItem {
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
            ClassView().tabItem {
                Image(systemName: "book")
                    .font(.system(size: 20))
                Text("Subjects")
                .font(.system(size: 20))
            }
            Pay().tabItem {
                Image(systemName: "creditcard")
                    .font(.system(size: 20))
                Text("Pay")
                .font(.system(size: 20))
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme,.dark)
    }
}

