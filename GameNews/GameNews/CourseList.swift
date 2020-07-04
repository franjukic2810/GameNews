//
//  CourseList.swift
//  GameNews
//
//  Created by Fran Jukic on 31/03/2020.
//  Copyright © 2020 Fran Jukic. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    @State var courses = courseData
    @State var active = false
    @State var activeIndex = -1
    
    var body: some View {
        ZStack {
            Color.black.opacity(active ? 0.5 : 0)
            .animation(.linear)
            .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 30) {
                    Text("Courses")
                        .font(.system(size: 28,weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(courses.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            CourseView(show: self.$courses[index].show, course: self.courses[index], active: self.$active,index: index,
                             activeIndex: self.$activeIndex
                            )
                                .offset(y: self.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                        .frame(height: 280)
                        .frame(maxWidth: self.courses[index].show ? .infinity : screen.width - 60)
                       .zIndex(self.courses[index].show ? 1 : 0)
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            .statusBar(hidden: active ? true : false)
            .animation(.linear)
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    var course: Course
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    
    var body: some View {
        ZStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 30.0) {
                    Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                    
                    Text("About this course")
                        .font(.title).bold()
                    
                    Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                    
                    Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
                }
                .padding(30)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)
                .offset(y: show ? 460 : 0)
                .background(Color("background1"))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .opacity(show ? 1 : 0)
                
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text(course.title)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                            Text(course.text)
                                .foregroundColor(Color.white.opacity(0.7))
                        }
                        Spacer()
                        ZStack {
                            Image(systemName: "gamecontroller")
                                .frame(width: 45, height: 45)
                                .background(Color("background1"))
                                  .clipShape(Circle())
                                 .shadow(radius: 10)
                                .opacity(show ? 0 : 1)
                            
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 25, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 45, height: 45)
                            .background(Color.black)
                            .clipShape(Circle())
                            .opacity(show ? 1 : 0)
                        }
                    }
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Image(uiImage: course.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(y: 30)
                            .frame(width: 220)
                        .frame(height: 200)
                    }
                    .padding(.top,10)
                }
                .padding(.horizontal,30)
                .padding(.top,20)
                .padding(show ? 30 : 20)
                .padding(.top, show ? 30 : 0)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                    .background(Color(course.color))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
                    .onTapGesture {
                        self.show.toggle()
                        self.active.toggle()
                        if self.show {
                            self.activeIndex = self.index
                        } else {
                            self.activeIndex = -1
                        }
                    }
            
            }
            .frame(height: show ? screen.height : 280)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var image: UIImage
    var logo: Image
    var color: UIColor
    var show: Bool
}

// postavljamo informacije o varijabli(jer ćemo ih koristiti više puta)
let courseData = [
    Course(title: "Super Mario",text: "Nova zvijezda dana",image: #imageLiteral(resourceName: "1"),logo: Image(systemName: "triangle"),color: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1),show: false),
    Course(title: "Zelda",text: "Nintendo best seller",image: #imageLiteral(resourceName: "2"),logo: Image(systemName: "triangle"),color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1),show: false),
    Course(title: "Pokemon",text: "Legendarno",image: #imageLiteral(resourceName: "3"),logo: Image(systemName: "triangle"),color: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1),show: false),
    Course(title: "Animal Crossing",text: "Opuštajuće",image: #imageLiteral(resourceName: "4"),logo: Image(systemName: "triangle"),color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),show: false),
    Course(title: "Retro: Mario",text: "Super Mario World",image: #imageLiteral(resourceName: "5"),logo: Image(systemName: "triangle"),color: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1),show: false)
]


