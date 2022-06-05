//
//  WalletPurchasesView.swift
//  MockBank
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct WalletPurchasesView: View {
    var title = "Groceries"
    var subtitle = "6 Transactions"
    var number = "1"
    var amount = "$364.00"
    var color = Color.blue
    
    var body: some View {
        HStack(spacing: 12) {
            VStack {
                Text(number).bold()
            }
            .foregroundColor(Color.text)
            .frame(width: 50, height: 50)
            .background(Color.systemBackground)
            .mask(RoundedCorner(radius: 30, corners: [.topRight, .bottomLeft]))
            
            VStack(alignment: .leading) {
                Text(title).font(.headline)
                Text(subtitle).font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(amount)
        }
    }
}

struct WalletPurchasesView_Previews: PreviewProvider {
    static var previews: some View {
        WalletPurchasesView()
    }
}
