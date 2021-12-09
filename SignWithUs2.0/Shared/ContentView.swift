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

struct Word:Hashable, Codable, Identifiable {
    let word_val:String
    var id = UUID()
    let image_path:String
}

var words=[
    Word(word_val:"afternoon", image_path: "afternoon"),
    Word(word_val:"before", image_path: "before"),
    Word(word_val:"buy", image_path: "buy"),
    Word(word_val:"doctor", image_path: "doctor"),
    Word(word_val:"drink", image_path: "drink"),
    Word(word_val:"finish", image_path: "finish"),
    Word(word_val:"hour", image_path: "hour")
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

struct Booking: Hashable, Codable, Identifiable {
    var date: Date?
    var id = UUID()
    var startTime: String
    var endTime: String
    var eventType: String
    var additionalNotes: String
    var street1: String
    var street2: String
    var city: String
    var state: String
    var zip: String
    var interpreter: String
    
    func address() -> String {
        if !self.street2.isEmpty {
            let addPar1 = self.street1 + ", " + self.city
            return  addPar1 + ", " + self.state + " " + self.zip
        } else {
            let addPar1 = self.street1 + ", " + self.street2 + ", " + self.city
            return  addPar1 + ", " + self.state + " " + self.zip
        }
        
    }
    
}

var schedTabBooking = Booking(date: nil,
                              startTime: "",
                              endTime: "",
                              eventType: "",
                              additionalNotes: "",
                              street1: "",
                              street2: "",
                              city: "",
                              state: "",
                              zip: "",
                              interpreter: "")

var interpTabBooking = Booking(date: nil,
                              startTime: "",
                              endTime: "",
                              eventType: "",
                              additionalNotes: "",
                              street1: "",
                              street2: "",
                              city: "",
                              state: "",
                              zip: "",
                              interpreter: "")

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
    Interpreter(name: "Leo Ogden", location: "Brooklyn, NY", imageName: "Leo",yrsExper: 10, earlDate: "12/22/2021", typicalAvailibility: "Monday - Thursday, 9am - 10pm", rating: 4.3, numRatings: 103, bio: "Born to a deaf mother, Leo learned American Sign Language at a very young age. He has always been very involved in the deaf community, and after attending college to train as an interpreter, he continues to help in a professional capacity. He now lives in Brooklyn, NY, and has worked many large profile events across the NYC metro area."),
    Interpreter(name: "Rachel Moon", location: "Boston, MA", imageName: "Rachel", yrsExper: 5, earlDate: "12/01/2021", typicalAvailibility: "Friday - Sunday, 3pm - 12pm",rating: 4.9, numRatings: 20, bio: "Rachel has been a freelance interpreter in the greater Boston area for over 5 years. She specializes in lecture style events and often is hired at local colleges."),
    Interpreter(name: "Gail Smith", location: "San Diego, CA", imageName: "Gail", yrsExper: 20, earlDate: "12/16/2021", typicalAvailibility: "Monday - Friday, 9am - 5pm",rating: 3.8, numRatings: 233, bio: "Gail has been hard of hearing since she was a child. She learned ASL from a young age, and wanted to be able to help others who are not able to hear at all to better interact with the world. She has been an interpreter in the San Diago area for over 20 years, specializing in small venues and personal appointments."),
    Interpreter(name: "Sal DiMarco", location: "Tampa, FL", imageName: "Sal", yrsExper: 7, earlDate: "11/10/2021", typicalAvailibility: "Saturday - Sunday, 8am - 8pm",rating: 4.6, numRatings: 90, bio: "Sal went to college and intended to learn Sign Langauage as an elective course. In the process he met the love of his life, who happens to be deaf. Sal went on to major in ASL, and became an official interpreter 7 yearsa ago. He hopes to inspire more people like him to learn ASL."),
    Interpreter(name: "Akanksa Patel", location: "Seattle, WA", imageName: "Ak", yrsExper: 29, earlDate: "11/21/2021", typicalAvailibility: "Monday - Friday, 6am - 3pm",rating: 4.8, numRatings: 368, bio: "Akaknsa has been teaching ASL to university students for over 30 years. In her free time she likes to further give back to the community by providing interpreting services. She works many different events, large and small.")
]

struct ContentView: View {
    @Binding var showConfirmedBooking: Bool
    @State private var showWebView = false
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var street1: String = ""
    @State private var street2: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var zip: String = ""
    @State private var fromScheduleTabOnHome = false
    @State private var fromScheduleTabToSched = true
    @State var booking = interpTabBooking
    @State var schedbooking = schedTabBooking
    init(_ showConfirmedBooking: Binding<Bool>) {
        //Use this if NavigationBarTitle is with Large Font
        //UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(displayP3Red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, alpha: 1.0)]
        self._showConfirmedBooking = showConfirmedBooking
    }
    var body: some View {
            TabView(selection: .constant(1))      {
                NavigationView {
                    
                    ScrollView{
                        VStack(alignment: .leading) {
                        
                        //Upcoming Appointments Secion------
                            Text("Upcoming Appointments").font(.title).foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).multilineTextAlignment(.leading).padding(.bottom, 1.0).navigationBarTitle("Home")
                        
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
                        Text("Featured Interpreter").font(.title).foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).multilineTextAlignment(.leading)
                        
                        HStack {
                            Image("Interpreter_photo").scaleEffect(0.5).frame(width: 100, height: 100).padding(.horizontal)
                            VStack(alignment: .leading) {
                                Text("Mark Parlatto").bold()}
                        }.padding(.bottom, 5.0)
                        Text("Originating from Long Island, NY, with over 20 years of experience, he is the go-to ASL interpreter of the Tristate Area.").padding(.bottom, 5.0).fixedSize(horizontal: false, vertical: true)
                        
                        //Featured News Section-------------
                        Text("Featured News").font(.title).foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).multilineTextAlignment(.leading)
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
                    .padding(.leading, 12.0).navigationBarItems( trailing: NavigationLink(destination: Account(firstname: $firstname,
                                lastname: $lastname,
                                username: $username,
                                email: $email,
                                phone: $phone,
                                street1: $street1,
                                street2: $street2,
                                city: $city,
                                state: $state,
                                zip: $zip)) {
                        Text("Account").foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    })
                }.tabItem {
                    Image(systemName: "house.fill")
                    Text("Home") }.tag(1)
//----------------------------------------------------------
                //Schedule Tab
                NavigationView {
                    ScheduleView(booking: $schedbooking, showConfirmedBooking: $showConfirmedBooking, fromScheduleTab: $fromScheduleTabToSched).navigationTitle("Schedule")

                }.tabItem {
                    Image(systemName: "calendar.badge.clock")
                    Text("Scheudle") }.tag(2)
//----------------------------------------------------------
                //Interpreters Tab
                NavigationView {
                    InterpretersView(booking: $booking, fromScheduleTab: $fromScheduleTabOnHome,showConfirmedBooking: $showConfirmedBooking)
                }.tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Interpreters") }.tag(3)
//----------------------------------------------------------
                //Learn Tab
                NavigationView {
                                   ScrollView{
                                           VStack(alignment: .leading) {
                                           
                                           //Upcoming Appointments Secion------
                                               Text("Sign Language Dictionary").font(.title)  .foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).multilineTextAlignment(.leading).padding(.bottom, 1.0).navigationBarTitle("Learn")
                                           
                                               
                                               List (words) { word in
                                                   NavigationLink(destination: WordDetail(word: word)) {
                                                   WordRow(word: word)
                                                   }

                                               }.padding([.top, .bottom, .trailing], 10).frame(height: 400.0)
                                           
                                               
                                           }.padding(.trailing)
                                   }.padding(.leading, 12.0)
                               }.tabItem {
                                   Image(systemName: "book.fill")
                                       
                                   Text("Learn") }.tag(4)
            }.accentColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)) //Nav stuf can go here
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(.constant(false))
        //
    }
}
