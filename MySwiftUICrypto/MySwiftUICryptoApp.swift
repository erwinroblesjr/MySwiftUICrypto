//
//  MySwiftUICryptoApp.swift
//  MySwiftUICrypto
//
//  Created by Erwin Robles on 4/11/24.
//

import SwiftUI

@main
struct MySwiftUICryptoApp: App {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationStack {
                HomeView()
            }.environmentObject(vm)
            
        }
        
    }
    
}
