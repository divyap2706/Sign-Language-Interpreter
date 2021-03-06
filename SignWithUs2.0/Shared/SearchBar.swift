//
//  SearchBar.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/9/21.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var searchby: String
    @State private var isEditing = false
 
    var body: some View {
        VStack{
            HStack{
            Spacer()
                .frame(width: 200.0)
                DropDown(searchby: $searchby)}
            if (searchby != "") {
            HStack {

            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8).overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                   
                    
                    if isEditing {
                        Button(action: {
                            self.text = ""
                            // Dismiss the keyboard
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
            )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
            
            }
            
        }
    }
}
    
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), searchby: .constant(""))
    }
}
