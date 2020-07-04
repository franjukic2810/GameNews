//
//  Pay.swift
//  GameNews
//
//  Created by Fran Jukic on 10/04/2020.
//  Copyright © 2020 Fran Jukic. All rights reserved.
//

import SwiftUI

func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}

func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let impactStyle = UIImpactFeedbackGenerator(style: style)
    impactStyle.impactOccurred()
}

struct Pay: View {
    var body: some View {
    ScrollView {
            PayView()
        
        VStack {
            HStack {
                Text("Included")
                    .font(.system(size: 28,weight: .bold))
                
                Spacer()

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
        }
      }
     .frame(maxWidth: .infinity,maxHeight: .infinity)
      .background(Color("background3"))
      .edgesIgnoringSafeArea(.all)
    }
}

struct PayView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("1")
                    .resizable()
                    .offset(y: 30)
                    .aspectRatio(contentMode: .fit)
                    .offset(x: 0,y: -50)
                VStack {
                    Text("Subscribe for more.")
                        .font(.system(size: 23,weight: .bold))
                    Text("Only 3 dollars per month")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .offset(x: 0,y: 130)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .cornerRadius(10)
            .background(Color.red)
            .shadow(color: Color.red,radius: 10)
            .edgesIgnoringSafeArea(.all)
            
            Spacer()
            .frame(height: 90)
            
            PayButton()
        }
        .padding(.bottom,40).background(Color("background3"))
        
    }
}

struct PayButton: View {
    @State var pressed = false
    @GestureState var tap = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 0.5)
            .updating($tap) { currentstate, gestureState,
                transaction in
                gestureState = currentstate
                impact(style: .light)
        }
        .onEnded { finished in
            self.pressed.toggle()
            impact(style: .heavy)
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                Image("fingerprint")
                    .scaleEffect(pressed ? 0 : 1)
                    .opacity(pressed ? 0: 1)
                
                Image("fingerprint-2")
                    .clipShape(Rectangle().offset(y: tap ? 1 : 50))
                    .scaleEffect(pressed ? 0 : 1)
                    .opacity(pressed ? 0: 1)
                
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 44, weight: .light, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                    .rotation3DEffect(Angle(degrees: pressed ? 0 : 30), axis: (x: 10, y: 0, z: 0))
                    .scaleEffect(pressed ? 1 : 0)
                    .opacity(pressed ? 1: 0)
            }
        }
        .frame(width: 120, height: 120)
        .background(
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(pressed ? #colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(pressed ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color(#colorLiteral(red: 0.7256438732, green: 0.7787529826, blue: 0.8831245303, alpha: 1)), radius: pressed ? 10 : 3, x: pressed ? 5 : -5, y: pressed ? 5 : -5)
                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 3, x: pressed ? -3 : 3, y: pressed ? -3 : 3)
            }
        )
        .overlay(
            Circle()
                .trim(from: tap ? 0.001 : 1, to: 1)
            .stroke(
                LinearGradient(gradient: Gradient(colors: [Color(pressed ? #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.4196078431, green: 0.2980392157, blue: 0.9490196078, alpha: 1)), Color(pressed ? #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5, lineCap: .round)
            )
            .frame(width: 88, height: 88)
            .rotationEffect(Angle(degrees: 90))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
            .shadow(color: Color(pressed ? #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.4196078431, green: 0.2980392157, blue: 0.9490196078, alpha: 1)).opacity(0.3), radius: 5, x: 0, y: 3)
                .animation(.easeInOut)
        )
            .clipShape(Circle())
            .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 0, x: pressed ? -1 : 1, y: pressed ? -1 : 1)
            .shadow(radius: 10)
            .scaleEffect(tap ? 1.2 : 1)
            .gesture(longPress)
    }
}


struct Pay_Previews: PreviewProvider {
    static var previews: some View {
        Pay().environment(\.colorScheme,.dark)
    }
}
