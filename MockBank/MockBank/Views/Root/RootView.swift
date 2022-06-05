//
//  Root.swift
//  MockBank
//
//  Created by Nuno Mota on 04/06/2022.
//

import SwiftUI
import TransactionsMicroservice

struct RootView: View {
    @State var selectedTab: String
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                switch selectedTab {
                case "house":
                    WalletView()
                    
                case "wallet.pass":
                    let viewModel = TransactionListViewmodel(transactionsClient: TransactionsClient())
                    
                    TransactionView(viewmodel: viewModel)
                default:
                    StocksViewContentView()
                }
                
                Spacer(minLength: 80)
            }
            .background(Color.background)
            
            CustomTabView(selectedTab: $selectedTab)
                .background(Color.background)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RootView(selectedTab: "house")
            RootView(selectedTab: "house")
                .preferredColorScheme(.dark)
        }
    }
}
