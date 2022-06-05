//
//  StocksView.swift
//  MockBank
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct StocksView: View {
    var body: some View {
        VStack {
            StocksViewContentView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .ignoresSafeArea(edges: .bottom)
    }
}

struct StocksView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StocksView()
                .background(.black)
            StocksView()
                .background(.black)
                .preferredColorScheme(.dark)
        }
    }
}
