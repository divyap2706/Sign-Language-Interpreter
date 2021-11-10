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

struct Interpreter: Hashable, Codable, Identifiable {
    let name: String
    let id = UUID()
    let location: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    var earlDate: String
}

var interpreters = [
    Interpreter(name: "Leo Ogden", location: "Brooklyn, NY", imageName: "Leo",earlDate: "12/22/2021"),
    Interpreter(name: "Rachel Moon", location: "Boston, MA", imageName: "Rachel", earlDate: "12/01/2021"),
    Interpreter(name: "Gail Smith", location: "San Diego, CA", imageName: "Gail", earlDate: "12/16/2021"),
    Interpreter(name: "Sal DiMarco", location: "Tampa, FL", imageName: "Sal", earlDate: "11/10/2021"),
    Interpreter(name: "Akanksa Patel", location: "Seattle, WA", imageName: "Ak", earlDate: "11/21/2021")
]

struct ContentView: View {
    @State private var showWebView = false
    @State private var searchText = ""
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
                        Text("Originating from Long Island, NY, with over 20 years of experience, he is the go-to ASL interpreter of the Tristate Area.").padding(.bottom, 5.0).fixedSize(horizontal: false, vertical: true)
                        
                        //Featured News Section-------------
                        Text("Featured News").font(.title).multilineTextAlignment(.leading)
                        HStack {
                            Image("eternals").scaleEffect(0.5).frame(width: 100, height: 100).padding(.horizontal)
                            VStack(alignment: .leading) {
                                Text("'Eternals' star Lauren Ridloff, Marvel's first deaf hero, on representation and access").bold().fixedSize(horizontal: false, vertical: true)}
                            .padding(.trailing)
                        }
                        Text("\"[I] hope that, by bringing my story to the audience, people from marginalized communities will feel that there’s room for their own stories.\"").fixedSize(horizontal: false, vertical: true)
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
                NavigationView {
                    ScrollView{
                        VStack(alignment: .leading){
                            Text("Date").font(.title).multilineTextAlignment(.leading).navigationBarTitle("Schedule")
                        }
                    }
                }.tabItem {
                    Image(systemName: "calendar.badge.clock")
                    Text("Scheudle") }.tag(2)
//----------------------------------------------------------
                //Interpreters Tab
                NavigationView {
                        VStack(alignment: .leading){
                            
                            SearchBar(text: $searchText)
                                .multilineTextAlignment(.leading)
                                    .navigationBarTitle("Interpreters")
                            InterpreterList()
                    }
                }.tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Interpreters") }.tag(3)
//----------------------------------------------------------
                //Learn Tab
                Text("Learn").tabItem {
                    Image(systemName: "book.fill")
                        
                    Text("Learn") }.tag(4)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
