//
//  ContentView.swift
//  About Me App
//  Kode With Klossy Mobile Develoment Training Assignment
//  Created by Sanjida Orpi
//

import SwiftUI

struct ContentView: View {
    @State private var age = false
    @State private var city = false
    @State private var hobby = false
    @State private var love = false
    
    public let timer = Timer.publish(every: 8, on: .main, in: .common).autoconnect()
        @State private var selection = 0
        let images = ["food1","food2","food3","food4","food5"]
        let images2 = ["kiwi","kelso","kirby"]
    
    var body: some View {
        ZStack {
                Image("plants")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Image("me")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 5)
                                .padding()
                            
                            Text("Sanjida Orpi")
                                .fontWeight(.bold)
                                .padding()
                                .font(.system(.largeTitle, design: .rounded))
                                .foregroundColor(.white)
                            
                            VStack {
                                Toggle(isOn: $love) {
                                    Text("Something I really love is..")
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.white)
                                }
                                    .toggleStyle(SwitchToggleStyle(tint: .black))
                                if love {
                                    Text("Animals!!! (my 3 cats)")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    ZStack{
                                        TabView(selection : $selection){
                                            ForEach(0..<3){ i in Image("\(images2[i])")
                                                .resizable()
                                                .scaledToFill()
                                            }
                                        }
                                        .tabViewStyle(PageTabViewStyle())
                                    }
                                    .aspectRatio(4/3, contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                            }
                            .padding()
                            
                            VStack {
                                Toggle(isOn: $hobby) {
                                    Text("What do I love to do?")
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.white)
                                }
                                .toggleStyle(SwitchToggleStyle(tint: .black))
                                if hobby {
                                    Text("Cook, crochet, sew, design, & read! Here's some things I've cooked:")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    ZStack{
                                        TabView(selection : $selection){
                                            ForEach(0..<5){ i in Image("\(images[i])")
                                                .resizable()
                                                .scaledToFill()
                                            }
                                        }
                                        .tabViewStyle(PageTabViewStyle())
                                    }
                                    .aspectRatio(4/3, contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                            }
                            .padding()
                            
                            VStack {
                                Toggle(isOn: $age) {
                                    Text("How old am I?")
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.white)
                                }
                                    .toggleStyle(SwitchToggleStyle(tint: .black))
                                if age {
                                    Text("19 years old")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                }
                            }
                            .padding()
                            
                            VStack {
                                Toggle(isOn: $city) {
                                    Text("Where am I from?")
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.white)
                                }
                                .toggleStyle(SwitchToggleStyle(tint: .black))
                                if city {
                                    Text("Queens, New York")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                        }
                    }
                    .padding()
                }
        }
        
    }
    
}

struct AboutMeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
