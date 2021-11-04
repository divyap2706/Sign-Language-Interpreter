//
//  ContentView.swift
//  Shared
//
//  Created by Maximilian Christ on 10/20/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView(selection: .constant(1)) {
                Text("Home").tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")}.tag(1)
                Text("Scheudle").tabItem {
                    Image(systemName: "calendar.badge.clock")
                    Text("Scheudle") }.tag(2)
                Text("Interpreters").tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Interpreters") }.tag(2)
                Text("Learn").tabItem {
                    Image("Learn 75")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color.gray)
                        
                    Text("Learn") }.tag(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
