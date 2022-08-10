//
//  AddPayListItem.swift
//  Money
//
//  Created by Артем Черненко on 09.08.2022.
//

import SwiftUI

struct AddPayListItem: View {
    @Environment(\.dismiss) private var dismiss
    @State private var money = 0
    @State private var name = ""
    @Binding var payList: [PayList]
    
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
                payList.append(PayList.init(name: name, money: money))
                dismiss()
            })
            .padding(.vertical)
            
            Text("%Категория%")
            Text("%Признак регулярности%")
            Text("%Частота повторений%")
        }
    }
}

//struct AddPayListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPayListItem()
//    }
//}
