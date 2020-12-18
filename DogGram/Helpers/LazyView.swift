//
//  LazyView.swift
//  DogGram
//
//  Created by Yaqi Wang on 12/17/20.
//

import Foundation
import SwiftUI

struct lazyView<Content: View>: View {
    
    var content: () -> Content
    
    var body: some View {
        self.content()
    }
}
