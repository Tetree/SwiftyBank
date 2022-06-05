//
//  CardView.swift
//  MockBank
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct WalletCardView: View {
    var title = "Cards"
    var x: CGFloat = 100
    var y: CGFloat = -100
    
    var body: some View {
        VStack {
            Text(title).font(.title).bold()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(30)
                .foregroundColor(Color.text)
        }
        .foregroundColor(Color.primary)
        .frame(maxWidth: .infinity)
        .background(Color.systemBackground)
        .cornerRadius(10)
        .mask(RoundedCorner(radius: 30, corners: [.topLeft, .bottomRight]))
    }
}

struct WalletCardView_Previews: PreviewProvider {
    static var previews: some View {
        WalletCardView()
    }
}
