//
//  StocksCardView.swift
//  MockBank
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct StocksCardView: View {
    var title = "AAPL"
    
    var body: some View {
        VStack {
            Spacer()
            Text(title).font(.subheadline).bold()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(30)
                .foregroundColor(Color.text)
            Spacer()
        }
        .foregroundColor(Color.primary)
        .frame(maxWidth: .infinity)
        .background(Color.systemBackground)
        .cornerRadius(10)
        .mask(RoundedCorner(radius: 30, corners: [.topLeft, .bottomRight]))
    }
}

struct StocksCardView_Previews: PreviewProvider {
    static var previews: some View {
        StocksCardView()
    }
}
