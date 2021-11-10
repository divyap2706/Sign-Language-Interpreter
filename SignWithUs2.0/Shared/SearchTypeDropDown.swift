//
//  SearchTypeDropDown.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/9/21.
//

import Foundation
import SwiftUI

struct DropDown: View{
    @State var value = ""
    var placeholder = "Search By"
    var dropDownList = ["Location", "Name", "Earliest Appointment"]
    var body: some View {
        Menu {
            ForEach(dropDownList, id: \.self){ client in
                Button(client) {
                    self.value = client
                }
            }
        } label: {
            VStack(spacing: 5){
                HStack{
                    Text(value.isEmpty ? placeholder : value)
                        .foregroundColor(value.isEmpty ? .gray : .black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color.gray)
                        .font(Font.system(size: 20, weight: .bold))
                }
                .padding(.horizontal)
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 2)
            }
        }
    }
}

struct SearchType_Previews: PreviewProvider {
    static var previews: some View {
        DropDown()
    }
}
