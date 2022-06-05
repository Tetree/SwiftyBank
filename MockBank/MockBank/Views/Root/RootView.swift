//
//  Root.swift
//  MockBank
//
//  Created by Nuno Mota on 04/06/2022.
//

import SwiftUI
import TransactionsMicroservice

struct RootView: View {
    
    var body: some View {
        TabView {
            
            WalletView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            TransactionView(viewmodel: TransactionListViewmodel(transactionsClient: TransactionsClient()))
                .tabItem {
                    Image(systemName: "wallet.pass")
                    Text("Transactions")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
