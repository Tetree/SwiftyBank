//
//  WalletView.swift
//  MockBank
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "line.3.horizontal.decrease")
                    .foregroundColor(Color.icon)
                Spacer()
                Text("Wallet")
                    .font(.headline)
                Spacer()
                Image(systemName: "person.crop.circle")
                    .foregroundColor(Color.icon)
            }
            .padding()
            
            WalletCardView()
                .frame(height: 200)
                .padding(.horizontal, 24)
            
            Text("Categories")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(24)
            
            HStack {
                VStack {
                    WalletCardView(title: "Debit")
                        .frame(width: 160, height: 200)
                    WalletCardView(title: "Bank")
                        .frame(width: 160, height: 100)
                }
                VStack {
                    WalletCardView(title: "Coins")
                        .frame(width: 160, height: 150)
                    WalletCardView(title: "NFTs")
                        .frame(width: 160, height: 150)
                }
            }
            
            Text("Transactions")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(24)
            
            VStack {
                StocksView(title: "Apple", subtitle: "+1.7%", number: "1", amount: "$364.00")
                StocksView(title: "Google", subtitle: "+0.7%", number: "2", amount: "$952.00")
                StocksView(title: "Netflix", subtitle: "-1.4%", number: "3", amount: "$602.50")
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .background(Color.background)
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WalletView()
            WalletView()
                .preferredColorScheme(.dark)
        }
    }
}
