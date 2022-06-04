//
//  RecentTransactionsView.swift
//  MockBank
//
//  Created by Nuno Mota on 04/06/2022.
//

import SwiftUI

struct RecentTransactionsView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewmodel
    var body: some View {
        VStack {
            HStack {
                //MARK: Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                //MARK: - Navigation link
                NavigationLink {
                    
                } label : {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            //MARK: - Transaction List
            ForEach(Array(transactionListVM.transactions.prefix(6).enumerated()), id: \.element) { index, transaction in
                
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 5 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionsView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewmodel = {
        return TransactionListViewmodel(transactionsClient: PreviewTransactionApi())
    }()
    static var previews: some View {
        Group {
            RecentTransactionsView()
            RecentTransactionsView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
