//
//  TabBarButton.swift
//  MockBank
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct TabBarButton: View {
    
    var image:String
    @Binding var selectedTab:String
    
    var body: some View {
        
        GeometryReader { reader in
            
            Button {
                
                withAnimation {
                    selectedTab = image
                }
                
            } label: {
                Image(systemName: image == selectedTab ? "\(image).fill" : image)
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(Color.primary)
                    .offset(y: selectedTab == image ? -10 : 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxHeight: 45)
        
    }
}
