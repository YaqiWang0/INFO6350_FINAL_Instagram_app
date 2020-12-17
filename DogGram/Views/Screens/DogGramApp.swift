//
//  DogGramApp.swift
//  DogGram
//
//  Created by Yaqi Wang on 12/14/20.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct DogGramApp: App {
    
    init() {
        FirebaseApp.configure()
        
        // for google signin
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    GIDSignIn.sharedInstance().handle(url) // Google signin
                })
        }
    }
}
