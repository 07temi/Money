//
//  AddPayListItem.swift
//  Money
//
//  Created by Артем Черненко on 09.08.2022.
//

import SwiftUI

struct AddPayListItem: View {
    @Environment(\.dismiss) private var dismiss
    @State private var money = ""
    @State private var name = ""
    
    var body: some View {
        VStack{
            Text("Запланировать расход")
            TextField("Сумма", text: $money)
                .keyboardType(.numberPad)
                .padding(.horizontal)
                
            TextField("Наименование", text: $name)
                .padding(.horizontal)
            Button("Добавить", action: {
                
                dismiss()
            })
            .padding(.vertical)
            
            Text("%Категория%")
            Text("%Признак регулярности%")
            Text("%Частота повторений%")
        }
    }
}

struct AddPayListItem_Previews: PreviewProvider {
    static var previews: some View {
        AddPayListItem()
    }
}
