//
//  AddPayListItem.swift
//  Money
//
//  Created by Артем Черненко on 09.08.2022.
//

import SwiftUI

struct AddPayListItem: View {
    @Environment(\.managedObjectContext) private var viewContext
    //private var payList: PayList
    
    @Environment(\.dismiss) private var dismiss
    @State private var money: Int64 = 0
    @State private var name = ""
    @State private var isDone = false
    
    var body: some View {
        VStack{
            Text("Запланировать расход")
            TextField("Сумма", value: $money, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding(.horizontal)
                
            TextField("Наименование", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button("Добавить", action: {
                
                addPayListItem(money: money, name: name, isDone: isDone)
                dismiss()
            })
            .padding(.vertical)
            
            Text("%Категория%")
            Text("%Признак регулярности%")
            Text("%Частота повторений%")
        }
    }
    
    private func addPayListItem(money: Int64, name: String, isDone: Bool) {
        let newPayItem = PayList(context: viewContext)
       
        newPayItem.name = name
        newPayItem.money = money
        newPayItem.isDone = isDone

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
}

//struct AddPayListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPayListItem()
//    }
//}
