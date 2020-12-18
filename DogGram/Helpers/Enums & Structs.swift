//
//  Enums & Structs.swift
//  DogGram
//
//  Created by Yaqi Wang on 12/17/20.
//

import Foundation


struct DatabaseUserField { //Fields within the user document in database
    
    static let displayName = "display_name"
    static let email = "email"
    static let providerID = "provider_id"
    static let provider = "provider"
    static let userID = "user_id"
    static let bio = "bio"
    static let dateCreated = "date_created"

}

struct DatabasePostField { //Fields within Post document in database
    
    static let postID = "post_id"
    static let userID = "user_id"
    static let displayName = "display_name"
    static let caption = "caption"
    static let dateCreated = "date_created"
    
}

struct CurrentUserDefaults { //Fields for UserDefaults saved within app
    
    static let displayName = "display_name"
    static let bio = "bio"
    static let userID = "user_id"
    
}
