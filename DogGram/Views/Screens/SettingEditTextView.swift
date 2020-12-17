//
//  SettingEditTextView.swift
//  DogGram
//
//  Created by Yaqi Wang on 12/16/20.
//

import SwiftUI

struct SettingEditTextView: View {
    
    @State var submissionText: String = ""
    @State var title: String
    @State var description: String
    @State var placeholder: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            
            HStack {
                Text(description)
                Spacer(minLength: 0)
            }
            
            TextField(placeholder, text: $submissionText)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(colorScheme == .light ? Color.MyTheme.beigeColor : Color.MyTheme.purpleColor)
                .cornerRadius(20)
                .font(.headline)
                .autocapitalization(.sentences)
            
            Button(action: {
                
            }, label: {
                Text("Save".uppercased())
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
                    .cornerRadius(12)
            })
            .accentColor(colorScheme == .light ? Color.MyTheme.yellowColor : Color.MyTheme.purpleColor)
            
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationBarTitle(title)
    }
}

struct SettingEditTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingEditTextView(title: "title", description: "description", placeholder: "placeholder")
        }
        .preferredColorScheme(.dark)
    }
}
