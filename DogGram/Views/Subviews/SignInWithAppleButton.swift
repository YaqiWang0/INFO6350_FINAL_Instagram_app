//
//  SignInWithAppleButton.swift
//  DogGram
//
//  Created by Yaqi Wang on 12/16/20.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtonCustom: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
}
