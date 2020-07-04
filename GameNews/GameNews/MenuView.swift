//
//  MenuView.swift
//  GameNews
//
//  Created by Fran Jukic on 29/03/2020.
//  Copyright © 2020 Fran Jukic. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 16) {
                Text("Fran Jukić")
                
                Color.white
                    .frame(width: 38,height: 6)
                    .cornerRadius(3)
                    .frame(width: 130,height: 6,alignment: .leading)
                    .background(Color.black.opacity(0.08))
                    .cornerRadius(3)
                    .frame(width: 150,height: 24)
                    .background(Color.black.opacity(0.09))
                    .cornerRadius(10)
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign Out", icon: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color("background3"),Color("background3")]), startPoint: .top, endPoint: .bottom))
          .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
            .shadow(radius: 10)
            .padding(.horizontal,30)
        }
        
    }
}

struct MenuRow: View {
    var title:String
    var icon:String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20,weight: .light))
                .imageScale(.large)
                .frame(width: 32,height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
            Text(title)
                .font(.system(size: 20,weight: .bold,design: .default))
                .frame(width: 120,alignment: .leading)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().environment(\.colorScheme,.dark)
    }
}
