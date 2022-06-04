//
//  ContentView.swift
//  MockBank
//
//  Created by Nuno Mota on 01/06/2022.
//

import SwiftUI
import SwiftUICharts

struct TransactionView: View {
    @StateObject var viewmodel: TransactionListViewmodel
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    let cumulativeData = viewmodel.accumulateTransactionsForCurrentMonth()
                    
                    let expenses = cumulativeData.last?.1 ?? 0
                    
                    CardView {
                        VStack {
                            ChartLabel(expenses.formatted(.currency(code: "USD")),
                                       type: .title)
                            LineChart()
                        }
                        .background(Color.systemBackground)
                            
                    }
                    .data(cumulativeData)
                    .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                    .frame(height: 300)
                    
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
            
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct TransactionView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewmodel = {
        return TransactionListViewmodel(transactionsClient: PreviewTransactionApi())
    }()
    static var previews: some View {
        Group {
            TransactionView(viewmodel: TransactionListViewmodel(transactionsClient: PreviewTransactionApi()))
            
            TransactionView(viewmodel: TransactionListViewmodel(transactionsClient: PreviewTransactionApi()))
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
