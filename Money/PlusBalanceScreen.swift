//
//  AddBalanceScreen.swift
//  Money
//
//  Created by Артем Черненко on 03.08.2022.
//

import SwiftUI

struct PlusBalanceScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var money = ""
    @State private var name = ""
    @Binding var balance: Int64
    
    var body: some View {
        VStack{
            Text("Пополнить")
            TextField("Название", text: $name)
                .padding()
                .textFieldStyle(.roundedBorder)
            TextField("Сумма", text: $money)
                .keyboardType(.numberPad)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
            Button("Сохранить") {
                guard let sum = Int64(money) else {return}
                balance += sum
                addJournalItem(money: sum, name: name, typePlus: true)
                UserDefaults.standard.set(balance, forKey: "Balance")
                dismiss()
            }
            .padding(.vertical)
        }
    }
    
    private func addJournalItem(money: Int64, name: String, typePlus: Bool) {
        let newJournal = Journal(context: viewContext)
       
        newJournal.name = name
        newJournal.money = Int64(money)
        newJournal.date = Date()
        newJournal.typeIsPlus = typePlus

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
}


//struct AddBalanceScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        AddBalanceScreen()
//    }
//}
