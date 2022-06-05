//
//  TransactionRow.swift
//  MockBank
//
//  Created by Nuno Mota on 02/06/2022.
//

import SwiftUI
import Helpers
import SwiftUIFontIcon
import Models

struct TransactionRow: View {
    let transaction: Models.Transaction
    var body: some View {
        HStack(spacing: 20) {
            
            //MARK: - Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: Color.icon)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                //MARK: Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                //MARK: DATE
                Text(transaction.parsedDate, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            //MARK: Currency
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.isCredit ? Color.text : .primary)
        }
        .padding([.top, .bottom], 8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static let transactionPreviewData = Transaction(id: "1", date: "02/06/2022", institution: "BNP", account: "Visa Electron", merchant: "Apple", amount: 300, isCredit: true, categoryId: 675, category: "Wearables", isPending: false, isTransfer: false, isExpense: true, isEdited: false)
    
    static var previews: some View {
        Group {
            TransactionRow(transaction: transactionPreviewData)
            TransactionRow(transaction: transactionPreviewData)
                .preferredColorScheme(.dark)
        }
    }
}
