//
//  Home.swift
//  GameNews
//
//  Created by Fran Jukic on 03/04/2020.
//  Copyright © 2020 Fran Jukic. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var show = false
    @State var showProfile = false
    @State var viewState = CGSize.zero

    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            HomeView(showProfile: $showProfile)
            .padding(.top,44)
            .blur(radius: showProfile ? 20 : 0)
            .background(
                VStack {
                    LinearGradient(gradient: Gradient(colors: [Color("background2"),Color("background1")]), startPoint: .top, endPoint: .bottom)
                    Spacer()
                }
                .background(Color("background1"))
            )
            .animation(.default)
            .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                     self.showProfile.toggle()
                }
                .gesture(
                    DragGesture().onChanged{ value in
                        // ako je tranzicija onda je showprofile true(prikazuje se animacija)
                        self.viewState = value.translation
                        self.showProfile = true
                    }
                    .onEnded{ value in
                        // vraća se na početak i tranzicija se makiva
                        self.viewState = .zero
                        self.showProfile = false
                    }
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environment(\.colorScheme,.dark)
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    var body: some View {
        Button(action: {self.showProfile.toggle()}) {
            Image("Avatar")
                .resizable()
                .frame(width: 36,height: 36)
                .clipShape(Circle())
        }
    }
}

let screen = UIScreen.main.bounds
