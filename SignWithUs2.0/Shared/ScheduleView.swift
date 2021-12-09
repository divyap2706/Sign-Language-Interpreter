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
    @Binding var booking: Booking
    @Binding var showConfirmedBooking: Bool
    @Binding var fromScheduleTab: Bool
    @State private var date1 = date
    @State var tag: Int? = nil
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: curYear, month: curMonth, day: curDay)
        let endComponents = DateComponents(year: endYear, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    //var disableForm: Bool {booking.startTime.isEmpty}
    
    var body: some View {
        
        //ScrollView{
            VStack(alignment: .leading){
                //Text("Select a Date and Time").font(.title).foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).multilineTextAlignment(.leading).padding(.leading)
                
                Form{
                    Section(header: Text("Select a Date")){
                    DatePicker(
                        "Start Date",
                         selection: $date1,
                         in: dateRange,
                         displayedComponents: [.date]
                    ).datePickerStyle(GraphicalDatePickerStyle())
                    }.navigationBarTitle("Schedule").padding(.bottom, 3.0)
                
                    Section(header:  HStack{
                        Text("Available Times On:").bold()
                                Text(date1, style: .date)
                    }) {
                //Text("Start Time").bold()

                Picker(selection: $booking.startTime, label: Text("Select Start Time")) {
                    //Text("Select a Start Time").tag(0)
                    Text("10:00 am").tag("10:00 am")
                    Text("12:00 pm").tag("12:00 pm")
                    Text("3:00 pm").tag("3:00 pm")
                    Text("7:00 pm").tag("7:00 pm")
                }.padding(1.0)

                //Text("End Time").bold()
                
                Picker(selection: $booking.endTime, label: Text("Select End Time")) {
                    //Text("Select a Start Time").tag(0)
                    Text("11:00 am").tag("11:00 am")
                    Text("1:00 pm").tag("1:00 pm")
                    Text("4:00 pm").tag("4:00 pm")
                    Text("8:00 pm").tag("8:00 pm")
                }.padding(1.0)
                    }
                    
                    
                    
                }//End of Form
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination:  ScheduleLocationView(booking: $booking, showConfirmedBooking: $showConfirmedBooking, fromScheduleTab: $fromScheduleTab),tag: 3, selection: $tag){ EmptyView()}
                    Button(action: {
                        booking.date = date1
                        self.tag = 3
                    }, label: {
                        
                        Text("Next")
                                      .font(.headline)
                                      .foregroundColor(.white)
                              .multilineTextAlignment(.leading)
                              .padding()
                                      .frame(width: 320, height: 60)
                                      .background(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                                      .cornerRadius(15.0)
                    })//.disabled(disableForm)
            
                    
                Spacer()
                    }
                
            }.padding(.bottom)
        //}
    }
}



struct ScheduleView_Previews: PreviewProvider {
    @State static var previewBooking = schedTabBooking
    static var previews: some View {
        ScheduleView(booking: $previewBooking, showConfirmedBooking: .constant(false), fromScheduleTab: .constant(true))
    }
}
