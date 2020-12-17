//
//  OnBoardingView.swift
//  DogGram
//
//  Created by Yaqi Wang on 12/16/20.
//

import SwiftUI

struct OnBoardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showOnboardingPart2: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(radius: 12)
            
            Text("Welcome to DogGram!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Text("DogGram is the #1 for posting pictures of your  dog and sharing them across the world, We are a dog-loving community and we're happy to have you!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.purpleColor)
                .padding()
            
            
            Button(action: {
                showOnboardingPart2.toggle()
            }, label: {
                SignInWithAppleButtonCustom()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            })
            
            Button(action: {
                showOnboardingPart2.toggle()
            }, label: {
                HStack {
                    Image(systemName: "globe")
                    
                    Text("Sign in with Google")
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color(.sRGB, red: 222/255, green: 82/255, blue: 70/255, opacity: 1.0))
                
                .cornerRadius(6)
                .font(.system(size: 24, weight: .medium, design: .default))
            })
            .accentColor(Color.white)
            
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Continue as guest".uppercased())
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
                
            })
            .accentColor(.black)
            
        }
        .padding(.all, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.beigeColor)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .fullScreenCover(isPresented: $showOnboardingPart2, content: {
            OnboardingViewPart2()
        })
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
