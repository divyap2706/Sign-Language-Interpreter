//
//  InterpreterDetail.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/10/21.
//

import Foundation
import SwiftUI


struct InterpreterDetail: View {
    @State private var dummyVar = false
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                        //.frame(width: 11.0)
                    Text("10+ Years of Experience").bold().fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.leading)
                    //Spacer()
                    Image("Leo").resizable().frame(width: 150, height: 150)
                    Spacer()
                    //Text("4.5").bold().fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.leading)
                    Image(systemName: "star.fill").resizable().frame(width: 12, height: 12)
                    Image(systemName: "star.fill").resizable().frame(width: 12, height: 12)
                    Image(systemName: "star.fill").resizable().frame(width: 12, height: 12)
                    Image(systemName: "star.fill").resizable().frame(width: 12, height: 12)
                    Image(systemName: "star").resizable().frame(width: 12, height: 12)
                    Spacer()
                    
                    //
                }.padding(.top)
                
                HStack{
                    Spacer()
                    Text("Leo Ogden").bold().font(.title2)
                    Spacer()
                }
                .padding(.bottom)
                
                Text("Bio").bold().font(.title2).padding(.leading)
                
                Text("Born to a deaf mother, Leo learned American Sign Language at a very young age. He has always been very involeved in the deaf community, and after attending college to train as an interpreter, he continues to help in a professional capacity. He now lives in Brooklyn, NY, and has worked many large profile events across the NYC metro area.").padding([.leading, .bottom])
                
                Text("City").bold().font(.title2).padding(.leading)
                
                Text("Brooklyn, NY").padding([.leading, .bottom])
                
                Text("Earliest Available Appointment").bold().font(.title2).padding(.leading)
                
                Text("12/22/2021").padding([.leading, .bottom])
                
                Text("Typical Availability").bold().font(.title2).padding(.leading)
                
                Text("Monday - Friday, 7am - 8pm").padding([.leading, .bottom])

            }
            HStack{
            Button {
                dummyVar = true
            } label: {
                Text("Book Now").bold()
            }.foregroundColor(.blue)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 1)
            )
            
            Button {
                dummyVar = true
            } label: {
                Text("Rate").bold().padding(.horizontal)
            }.foregroundColor(.blue)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 1)
            )
            }.padding(.bottom)
            
        }
    }
}


struct InterpreterDetail_Previews: PreviewProvider {

    static var previews: some View {

        InterpreterDetail()

    }

}
