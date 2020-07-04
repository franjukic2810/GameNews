//
//  ClassView.swift
//  GameNews
//
//  Created by Fran Jukic on 09/04/2020.
//  Copyright © 2020 Fran Jukic. All rights reserved.
//

import SwiftUI

struct ClassView: View {
    @State var subject = subjectData
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("Predmeti")
                .font(.system(size: 28,weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                .padding(.top, 30)
                ForEach(subject) { subjects in
                    SubjectView(subject: subjects)
                }
            }
        }

    }
}

struct SubjectView: View {
    var subject: Subject
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack{
                Text(subject.title)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
                Text(subject.text)
                    .font(.system(size: 10))
                    .foregroundColor(Color.secondary)
            }
        }
        .padding()
        .frame(width: 350,height: 50)
        .background(BlurView(style: .systemThinMaterial))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct Subject: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: Image
    var show: Bool
}

// postavljamo informacije o varijabli(jer ćemo ih koristiti više puta)
let subjectData = [
    Subject(title: "Math",text: "Learn Math",logo: Image(systemName: "book"),show: false),
    Subject(title: "English",text: "Learn English",logo: Image(systemName: "bubble.left"),show: false),
    Subject(title: "Biology",text: "Learn Biology",logo: Image(systemName: "sun.max"),show: false),
    Subject(title: "Germany",text: "Learn Germany",logo: Image(systemName: "bubble.left"),show: false),
]

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
    }
}
