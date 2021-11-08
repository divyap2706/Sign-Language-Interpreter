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
    @State private var showWebView = false
    var body: some View {
            TabView(selection: .constant(1)) {
                NavigationView {
                    ScrollView{
                        VStack(alignment: .leading) {
                        
                        //Upcoming Appointments Secion------
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
                            
                        //Featured Interpreter Section------
                        Text("Featured Interpreter").font(.title).multilineTextAlignment(.leading)
                        
                        HStack {
                            Image("Interpreter_photo").scaleEffect(0.5).frame(width: 100, height: 100).padding(.horizontal)
                            VStack(alignment: .leading) {
                                Text("Mark Parlatto").bold()}
                        }.padding(.bottom, 5.0)
                        Text("Originating from Long Island, NY, with over 20 years of experience, he is the go-to ASL interpreter of the Tristate Area.").padding(.bottom, 5.0)
                        
                        //Featured News Section-------------
                        Text("Featured News").font(.title).multilineTextAlignment(.leading)
                        HStack {
                            Image("eternals").scaleEffect(0.5).frame(width: 100, height: 100).padding(.horizontal)
                            VStack(alignment: .leading) {
                                Text("'Eternals' star Lauren Ridloff, Marvel's first deaf hero, on representation and access").bold().padding(.trailing)}
                            .padding(.trailing)
                        }
                        Text("\"[I] hope that, by bringing my story to the audience, people from marginalized communities will feel that there’s room for their own stories.\"")
                        Button {
                            showWebView.toggle()
                        } label: {
                            Text("Read More...").padding(.top, 1.0)
                        }
                        .sheet(isPresented: $showWebView) {
                            WebView(url: URL(string: "https://www.nbcnews.com/pop-culture/pop-culture-news/eternals-star-lauren-ridloff-marvels-first-deaf-hero-representation-ac-rcna4661")!)
                        }}
                            .padding(.trailing)}
                    .padding(.leading, 12.0).navigationBarItems( trailing: NavigationLink(destination: Account()) {
                        Text("Account")
                    })
                }.tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")}.tag(1)
//----------------------------------------------------------
                //Schedule Tab
                Text("Scheudle").tabItem {
                    Image(systemName: "calendar.badge.clock")
                    Text("Scheudle") }.tag(2)
//----------------------------------------------------------
                //Interpreters Tab
                Text("Interpreters").tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Interpreters") }.tag(3)
//----------------------------------------------------------
                //Learn Tab
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
