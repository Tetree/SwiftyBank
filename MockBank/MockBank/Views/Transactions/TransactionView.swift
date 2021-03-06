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
        VStack {
            switch viewmodel.state {
            case .loading:
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.primary))
                        .scaleEffect(2)
                }
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                .background(Color.background)
            case .success:
                NavigationView {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text("Overview")
                                .font(.title2)
                                .bold()
                            
                            let cumulativeData = viewmodel.accumulateTransactionsForCurrentMonth()
                            
                            if !cumulativeData.isEmpty {
                                let expenses = cumulativeData.last?.1 ?? 0
                                
                                CardView {
                                    VStack(alignment: .leading) {
                                        ChartLabel(expenses.formatted(.currency(code: "USD")),
                                                   type: .title,
                                                   format: "$%.02f")
                                        LineChart()
                                    }
                                    .background(Color.systemBackground)
                                        
                                }
                                .data(cumulativeData)
                                .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                                .frame(height: 300)
                            }
                            
                            
                            RecentTransactionsView()
                                .environmentObject(viewmodel)
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        
                    }
                    .background(Color.background)
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
            case .failure(let errorMessage):
                VStack {
                    Spacer()
                    Text(errorMessage)
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                .background(Color.background)
            }
        }
        .onAppear() {
            viewmodel.getTransactions()
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(Color.background)

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
