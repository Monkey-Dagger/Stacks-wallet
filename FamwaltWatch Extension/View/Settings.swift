//
//  Settings.swift
//  FamwaltWatch Extension
//
//  Created by Shreyas Papinwar on 24/06/21.
//

import SwiftUI

struct Settings: View {
    @State var isShowingNetwork = false
    @State var isShowingAddresses = false
    
    func showNetwork() {
        isShowingNetwork.toggle()
    }
    
    func showAddresses() {
        isShowingAddresses.toggle()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                List {
                    Button(action: showNetwork) {
                        Text("Networks")
                    }
                        .sheet(isPresented: $isShowingNetwork) {
                            NetworkView()
                        }
                    
                    Button(action: showAddresses) {
                        Text("Addresses")
                    }
                        .sheet(isPresented: $isShowingAddresses) {
                            AddressesView()
                        }
                    
                }
                .navigationTitle("Settings")
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
