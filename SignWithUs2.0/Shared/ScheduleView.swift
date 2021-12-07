//
//  ScheduleView.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 12/2/21.
//

import SwiftUI

var date = Date()
let calendar = Calendar.current
let curYear = calendar.component(.year, from: date)
let curMonth = calendar.component(.month, from: date)
let curDay = calendar.component(.day, from: date)
let endYear = calendar.component(.year, from: date) + 5

struct ScheduleView: View {
    @State private var street1 = ""
    @State private var street2 = ""
    @State private var city = ""
    @State private var state = ""
    @State private var zip = ""
    @State private var date1 = date
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: curYear, month: curMonth, day: curDay)
        let endComponents = DateComponents(year: endYear, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Select a Date and Time").font(.title).foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).multilineTextAlignment(.leading).padding(.bottom, 1.0)
                HStack{
                    //Image(systemName: "chevron.backward").frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    DatePicker(
                        "Start Date",
                         selection: $date1,
                         in: dateRange,
                         displayedComponents: [.date]
                    ).datePickerStyle(GraphicalDatePickerStyle())
                   // Image(systemName: "chevron.forward").frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                HStack{
                    Text("Available Times On:").bold()
                Text(date1, style: .date)
                }.padding(.bottom)
                
                Text("Start Time").bold()

                Picker(selection: .constant(1), label: Text("Select Start Time")) {
                    Text("Select a Start Time").tag(0)
                    Text("10:00 am").tag(1)
                    Text("12:00 pm").tag(2)
                    Text("3:00 pm").tag(3)
                    Text("7:00 pm").tag(4)
                }.padding(1.0)

                Text("End Time").bold()
                
                Picker(selection: .constant(1), label: Text("Select Start Time")) {
                    Text("Select a Start Time").tag(0)
                    Text("11:00 am").tag(1)
                    Text("1:00 pm").tag(2)
                    Text("4:00 pm").tag(3)
                    Text("8:00 pm").tag(4)
                }.padding(1.0)
                
                
                HStack {
                    Spacer()
                //Button {
                    NavigationLink(destination:  ScheduleLocationView(street1: $street1, street2: $street2, city: $city, state: $state, zip: $zip))
                    {

                        
                    Text("Next")
                                .font(.headline)
                                .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding()
                                .frame(width: 320, height: 60)
                                .background(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                                .cornerRadius(15.0)
                
                    }
                Spacer()
                    }
            }
            .padding()
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
