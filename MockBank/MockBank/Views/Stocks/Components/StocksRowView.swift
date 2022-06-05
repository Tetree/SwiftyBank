//
//  StocksRowView.swift
//  MockBank
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct StocksRowView: View {
    var title = "Apple"
    var subtitle = "+1.7%"
    var number = "1"
    var amount = "$364.00"
    
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

struct StocksRowView_Previews: PreviewProvider {
    static var previews: some View {
        StocksRowView()
    }
}
