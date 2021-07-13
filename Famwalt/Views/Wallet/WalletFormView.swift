//
//  WalletFormView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 12/06/21.
//

import SwiftUI

struct WalletFormView: View {
    @EnvironmentObject var store: WalletStore
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var form: WalletForm
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.04703966528, green: 0.1053452119, blue: 0.2279646695, alpha: 1))

                Form {
                    Section(header: Text("Name")) {
                      TextField("test eth", text: $form.name)
                    }
                    Section(header: Text("address📝")) {
                      TextField("demo.eth", text: $form.address)
                    }
                }
                .foregroundColor(Color(#colorLiteral(red: 0.9581345916, green: 0.7898219228, blue: 0.7886767983, alpha: 1)))
                .navigationBarTitle("Wallet Form", displayMode: .inline)
                .navigationBarItems(
                  leading: Button("Cancel", action: dismiss),
                  trailing: Button(
                    form.updating ? "Update" : "Save",
                    action: form.updating ? updateWallet : saveWallet))
            }
        }
        
        
    }
}

// MARK: - Actions
extension WalletFormView {
    func dismiss() {
      presentationMode.wrappedValue.dismiss()
    }

    func saveWallet() {
      store.create(
        name: form.name,
        address: form.address
      )
      dismiss()
    }

    func updateWallet() {
      if let walletID = form.walletID {
        store.update(
          walletID: walletID,
          name: form.name,
          address: form.address)
        dismiss()
      }
    }
}

struct WalletFormView_Previews: PreviewProvider {
    static var previews: some View {
        WalletFormView(form: WalletForm())
    }
}
