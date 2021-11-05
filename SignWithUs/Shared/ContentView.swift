//
//  ContentView.swift
//  Shared
//
//  Created by Maximilian Christ on 10/20/21.
//

import SwiftUI

var vGridLayout = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct ContentView: View {
    var body: some View {
            TabView(selection: .constant(1)) {
                NavigationView {
                    VStack(alignment: .leading) {
                        Text("Upcoming Appointments").font(.title).multilineTextAlignment(.leading).navigationBarTitle("Home")
                        
                        LazyVGrid(columns: vGridLayout) {
                            
                            Text("Date").underline()
                            Text("Location").underline()
                            Text("Interpreter").underline().padding(.bottom, 1.0)
                            
                            Text("10/11/2021")
                            Text("Carnegie Hall, NY")
                            Text("Sam Smith")
                            Text("11/15/2021")
                            Text("Prospect Park")
                            Text("Helena Jacobs")
                        }.padding([.top, .bottom, .trailing], 10)
                            

                        Text("Featured Interpreter").font(.title).multilineTextAlignment(.leading)
                        Text("Featured News").font(.title).multilineTextAlignment(.leading)
                    }
                    .padding(.leading, 12.0).navigationBarItems( trailing: Button(action: {
                        print("Account button pressed...")
                    }) {
                        Text("Account")
                    })
                }.tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")}.tag(1)
                Text("Scheudle").tabItem {
                    Image(systemName: "calendar.badge.clock")
                    Text("Scheudle") }.tag(2)
                Text("Interpreters").tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Interpreters") }.tag(3)
                Text("Learn").tabItem {
                    Image("Learn 75")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color.gray)
                        
                    Text("Learn") }.tag(4)
            }
            
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
