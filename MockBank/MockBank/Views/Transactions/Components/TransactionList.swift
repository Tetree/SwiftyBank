//
//  TransactionList.swift
//  MockBank
//
//  Created by Nuno Mota on 04/06/2022.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewmodel
    var body: some View {
        VStack {
            List {
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key) { month, transactions in
                    
                    Section {
                        //MARK: - Transactions
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                        
                    } header: {
                        //MARK: - Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                    
                    
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewmodel = {
        return TransactionListViewmodel(transactionsClient: PreviewTransactionApi())
    }()
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
