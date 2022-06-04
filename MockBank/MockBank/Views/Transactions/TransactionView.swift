//
//  ContentView.swift
//  MockBank
//
//  Created by Nuno Mota on 01/06/2022.
//

import SwiftUI

struct TransactionView: View {
    @StateObject var viewmodel: TransactionListViewmodel
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    RecentTransactionsView()
                        .environmentObject(viewmodel)
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }.background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //MARK: - Navigation Item
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
            
        }.navigationViewStyle(.stack)
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionView(viewmodel: TransactionListViewmodel(transactionsClient: PreviewTransactionApi()))
            TransactionView(viewmodel: TransactionListViewmodel(transactionsClient: PreviewTransactionApi()))
                .preferredColorScheme(.dark)
        }
    }
}
