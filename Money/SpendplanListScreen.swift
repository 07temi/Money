//
//  SpendplanListScreen.swift
//  Money
//
//  Created by Артем Черненко on 04.08.2022.
//

import SwiftUI

struct SpendplanListScreen: View {
    @State var spendList = ["Строка 1","Строка 2","Строка 3","Строка 4","Строка 5"]
    var body: some View {
        List{
            ForEach(spendList, id: \.self) { spend in
                HStack{
                    Text("\(spend)")
                    Spacer()
                    Image(systemName: "checkmark")
                        .onTapGesture {
                            print("оплата")
                        }
                        .foregroundColor(.green)
                }
                .listRowSeparator(.hidden)
            }
            .onDelete(perform: deleteItems)
        }
        .listStyle(.inset)
    }
    
    func deleteItems(offsets: IndexSet) {
        withAnimation {
            spendList.remove(atOffsets: offsets)
        }
    }
}

struct SpendplanListScreen_Previews: PreviewProvider {
    static var previews: some View {
        SpendplanListScreen()
    }
}
