//
//  InterpreterDetail.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/10/21.
//

import SwiftUI


struct InterpreterDetail: View {
    var interpreter: Interpreter
    @State private var dummyVar = false
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                        //.frame(width: 11.0)
                    Text(String(interpreter.yrsExper) + " Years of Experience").bold().fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.leading)
                    //Spacer()
                    Image(interpreter.imageName).resizable().frame(width: 150, height: 150)
                    Spacer()
                    //Text("4.5").bold().fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.leading)
                    VStack{
                        HStack{
                            Image(systemName: starType(starInd: 1, numStars: interpreter.rating)).resizable().frame(width: 12, height: 12)
                    Image(systemName: starType(starInd: 2, numStars: interpreter.rating)).resizable().frame(width: 12, height: 12)
                    Image(systemName: starType(starInd: 3, numStars: interpreter.rating)).resizable().frame(width: 12, height: 12)
                    Image(systemName: starType(starInd: 4, numStars: interpreter.rating)).resizable().frame(width: 12, height: 12)
                    Image(systemName: starType(starInd: 5, numStars: interpreter.rating)).resizable().frame(width: 12, height: 12)}
                        Text(String(interpreter.numRatings) + " Ratings")
                    }
                    Spacer()
                    
                    //
                }.padding(.top)
                
                HStack{
                    Spacer()
                    Text(interpreter.name).bold().font(.title2)
                    Spacer()
                }
                .padding(.bottom)
                
                Text("Bio").bold().font(.title2).padding(.leading)
                
                Text(interpreter.bio).padding([.leading, .bottom])
                
                Text("City").bold().font(.title2).padding(.leading)
                
                Text(interpreter.location).padding([.leading, .bottom])
                
                Text("Earliest Available Appointment").bold().font(.title2).padding(.leading)
                
                Text(interpreter.earlDate).padding([.leading, .bottom])
                
                Text("Typical Availability").bold().font(.title2).padding(.leading)
                
                Text(interpreter.typicalAvailibility).padding([.leading, .bottom])

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

func starType(starInd: Int, numStars: Float) -> String {
    let flooredNumStars = floor(numStars)
    if abs(numStars - flooredNumStars) > 0 {
        // Cases when numStars is a float
        if starInd <= Int(flooredNumStars) {
            return "star.fill"
        } else if starInd == Int(flooredNumStars) + 1 {
            //change this to the updated icon in xcode 13 "star.leadinghalf.filled"
            return "star"
        } else {
            return "star"
        }
    } else {
        // Cases when numStars is an integer
        if starInd <= Int(flooredNumStars) {
            return "star.fill"
        } else {
            return "star"
        }
    }
}

struct InterpreterDetail_Previews: PreviewProvider {

    static var previews: some View {

        InterpreterDetail(interpreter: interpreters[0])

    }

}
