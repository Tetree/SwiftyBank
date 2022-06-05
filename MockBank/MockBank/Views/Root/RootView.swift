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
            
            let viewModel = TransactionListViewmodel(transactionsClient: TransactionsClient())
            
            TransactionView(viewmodel: viewModel)
                .onAppear() {
                    viewModel.getTransactions()
                }
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
