//
//  HomeView.swift
//  GameNews
//
//  Created by Fran Jukic on 29/03/2020.
//  Copyright © 2020 Fran Jukic. All rights reserved.
//

import SwiftUI


struct HomeView: View {
    @Binding var showProfile: Bool
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 20) {
                        Text("Best Games")
                            .font(.system(size: 28,weight: .bold))
                        
                        Spacer()
                        
                        AvatarView(showProfile: $showProfile)

                }
                .padding(.horizontal,30)
                .padding(.top,30)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(sectionData){ item in
                            SectionView(section: item, width: 275,height: 275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                }
                .offset(y: -30)
                
                HStack {
                    Text("Games")
                        .font(.title).bold()
                        .padding(.bottom,20)
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(sectionData) { item in
                            SectionView(section: item, width: screen.width - 60, height: 275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                }

                .offset(y: -60)
                
                
                Spacer()
            }
        }
    }
}

struct SectionView: View {
    var section: Section
    var width: CGFloat
    var height: CGFloat
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(section.title)
                .font(.system(size: 24,weight: .bold))
                .frame(width: 160, alignment: .leading)
                .foregroundColor(Color.white)
                
                Text(section.text.uppercased())
                    .frame(maxWidth: .infinity,alignment: .leading)

            }

            section.image
                .resizable()
                .offset(y: 30)
                .aspectRatio(contentMode: .fill)
                .frame(width: 220)
                .frame(height: 200)
        }
        .padding(.horizontal,30)
        .padding(.top,20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3),radius: 20,x: 0,y: 20)

    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var image: Image
    var color: Color
}

// postavljamo informacije o varijabli(jer ćemo ih koristiti više puta)
let sectionData = [
    Section(title: "Super Mario",text: "Nova zvijezda dana",image: Image("1"),color: Color("card3")),
    Section(title: "Zelda",text: "Nintendo best seller",image: Image("2"),color: Color("card2")),
    Section(title: "Pokemon",text: "Legendarno",image: Image("3"),color: Color.yellow),
    Section(title: "Animal Crossing",text: "Opuštajuće",image: Image("4"),color: Color.green),
    Section(title: "Retro: Mario",text: "Super Mario World",image: Image("5"),color: Color("card3")),
    Section(title: "Kirby",text: "Slatko",image: Image("6"),color: Color.pink.opacity(0.09))
]

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}
