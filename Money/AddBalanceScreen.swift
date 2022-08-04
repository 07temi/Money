//
//  AddBalanceScreen.swift
//  Money
//
//  Created by Артем Черненко on 03.08.2022.
//

import SwiftUI

struct AddBalanceScreen: View {
   
    @Environment(\.dismiss) private var dismiss
    @State private var money = ""
    @Binding var balance: Int
    var operation: String
    
    var body: some View {
        VStack{
            Text(operation == "minus" ? "Потратить" : "Пополнить")
        TextField("Add money", text: $money)
            .keyboardType(.numberPad)
            .padding(.leading)
            Button("Сохранить") {
                guard let sum = Int(money) else {return}
                if operation == "minus" {
                    print("-")
                    balance -= sum
                } else {
                    print("+")
                    balance += sum
                }
                print("\(balance)")
                dismiss()
            }
        }
    }
}


//struct AddBalanceScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        AddBalanceScreen()
//    }
//}
