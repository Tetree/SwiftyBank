//
//  StocksViewContentView.swift
//  MockBank
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct StocksViewContentView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 3, style: .continuous)
                .frame(width: 40, height: 5)
                .padding(8)
            
            HStack(spacing: 16) {
                Text("Stocks").font(.largeTitle).bold()
                Button {} label: {
                    Label("Buy", systemImage: "plus.circle.fill")
                        .font(.body.bold())
                        .foregroundColor(.white)
                        .padding(8)
                        .padding(.horizontal, 8)
                }
                .background(Color(UIColor(.accentColor)))
                .cornerRadius(30)
                
                Spacer()
            }
            .padding(24)
            
            HStack {
                StocksCardView(title: "AAPL")
                    .frame(width: 140, height: 200)
                Spacer()
                StocksCardView(title: "GOOGL")
                    .frame(width: 140, height: 200)
            }
            .padding(24)
            .background(Color.icon.opacity(0.2))
            
            Text("Stocks")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(24)
            
            VStack {
                StocksRowView(title: "Apple", subtitle: "+1.7%", number: "1", amount: "$364.00")
                StocksRowView(title: "Google", subtitle: "-5%", number: "2", amount: "$952.00")
                StocksRowView(title: "Amazon", subtitle: "+12%", number: "3", amount: "$602.50")
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .background(Color.background)
    }
}

struct StocksViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StocksViewContentView()
            StocksViewContentView()
                .preferredColorScheme(.dark)
        }
    }
}

