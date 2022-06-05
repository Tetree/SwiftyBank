//
//  CustomTabView.swift
//  MockBank
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct CustomTabView: View {
    
    @Binding var selectedTab: String
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            TabBarButton(image: "house", selectedTab: $selectedTab)
            TabBarButton(image: "wallet.pass", selectedTab: $selectedTab)
            TabBarButton(image: "tray.2", selectedTab: $selectedTab)
        }
        .padding()
        .background(Color.text)
        .cornerRadius(30)
        .padding(.horizontal)
        
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(selectedTab: "house")
    }
}
