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

struct Appointment: Hashable, Codable, Identifiable {
    let date: String
    var id = UUID()
    let location: String
    var interpreter: String
}

var appointments = [
    Appointment(date: "10/11/2021", location: "Carnegie Hall, NY", interpreter: "Sal Dimarco"),
    Appointment(date: "11/15/2021", location: "Prospect Park, NY", interpreter: "Gail Smith"),
    Appointment(date: "12/22/2021", location: "Jersey City, NJ", interpreter: "Leo Ogden")]

struct Interpreter: Hashable, Codable, Identifiable {
    let name: String
    var id = UUID()
    let location: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    var yrsExper: Int
    var earlDate: String
    var typicalAvailibility: String
    var rating: Float
    var numRatings: Int
    var bio: String
}

var interpreters = [
    Interpreter(name: "Leo Ogden", location: "Brooklyn, NY", imageName: "Leo",yrsExper: 10, earlDate: "12/22/2021", typicalAvailibility: "Monday - Thursday, 9am - 10pm", rating: 4.3, numRatings: 103, bio: "Born to a deaf mother, Leo learned American Sign Language at a very young age. He has always been very involeved in the deaf community, and after attending college to train as an interpreter, he continues to help in a professional capacity. He now lives in Brooklyn, NY, and has worked many large profile events across the NYC metro area."),
    Interpreter(name: "Rachel Moon", location: "Boston, MA", imageName: "Rachel", yrsExper: 5, earlDate: "12/01/2021", typicalAvailibility: "Friday - Sunday, 3pm - 12pm",rating: 4.9, numRatings: 20, bio: "Rachel has been a freelance interpreter in the greater Boston area for over 5 years. She specializes in lecture style events and often is hired at local colleges."),
    Interpreter(name: "Gail Smith", location: "San Diego, CA", imageName: "Gail", yrsExper: 20, earlDate: "12/16/2021", typicalAvailibility: "Monday - Friday, 9am - 5pm",rating: 3.8, numRatings: 233, bio: "Gail has been hard of hearing since she was a child. She learned ASL from a young age, and wanted to be able to help others who are not able to hear at all to better interact with the world. She has been an interpreter in the San Diago area for over 20 years, specializing in small venues and personal appointments."),
    Interpreter(name: "Sal DiMarco", location: "Tampa, FL", imageName: "Sal", yrsExper: 7, earlDate: "11/10/2021", typicalAvailibility: "Saturday - Sunday, 8am - 8pm",rating: 4.6, numRatings: 90, bio: "Sal went to college and intended to learn Sign Langauage as an elective course. In the process he met the love of his life, who happens to be deaf. Sal went on to major in ASL, and became an official interpreter 7 yearsa ago. He hopes to inspire more people like him to learn ASL."),
    Interpreter(name: "Akanksa Patel", location: "Seattle, WA", imageName: "Ak", yrsExper: 29, earlDate: "11/21/2021", typicalAvailibility: "Monday - Friday, 6am - 3pm",rating: 4.8, numRatings: 368, bio: "Akaknsa has been teaching ASL to university students for over 30 years. In her free time she likes to further give back to the community by providing interpreter services. She works many different events, large and small.")
]

struct ContentView: View {
    @State private var showWebView = false
    var body: some View {
        //NavigationView {
            TabView(selection: .constant(1)) {
                NavigationView {
                    
                    ScrollView{
                        VStack(alignment: .leading) {
                        
                        //Upcoming Appointments Secion------
                            Text("Upcoming Appointments").font(.title).multilineTextAlignment(.leading).padding(.bottom, 1.0).navigationBarTitle("Home")
                        
                            HStack{
                                //Spacer(minLength: 15)
                                Text("Date").underline().padding(.leading)
                                Spacer(minLength: 75)
                                Text("Location").underline()
                                Spacer(minLength: 30)
                                Text("Interpreter").underline().padding(.trailing)
                                Spacer()
                            }.padding(.vertical, 1.0)
                            List (appointments) { appointment in
                                NavigationLink(destination: AppointmentDetail(appointment: appointment)) {
                                AppointmentRow(appointment: appointment)
                                }

                            }.padding([.top, .bottom, .trailing], 10).frame(height: 152.0)
                            
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
                        .padding(.bottom)
                        .sheet(isPresented: $showWebView) {
                            WebView(url: URL(string: "https://www.nbcnews.com/pop-culture/pop-culture-news/eternals-star-lauren-ridloff-marvels-first-deaf-hero-representation-ac-rcna4661")!)
                        }}
                            .padding(.trailing)
                }// put closing bracket here for scroll view
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
                    InterpretersView()
                }.tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Interpreters") }.tag(3)
//----------------------------------------------------------
                //Learn Tab
                Text("Learn").tabItem {
                    Image(systemName: "book.fill")
                        
                    Text("Learn") }.tag(4)
            } //Nav stuf can go here
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
