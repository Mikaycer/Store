//
//  ContentView.swift
//  StoreApp
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var login: LoginViewModel
    
    var body: some View {
        Group{
            if login.authenticated == 1 {
                Home()
            }else {
                Login()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
