//
//  SpendplanListScreen.swift
//  Money
//
//  Created by Артем Черненко on 04.08.2022.
//

import SwiftUI

struct SpendplanListScreen: View {
   // @State var spendList = ["Строка 1","Строка 2","Строка 3","Строка 4","Строка 5"]
    @Binding var payList: [PayList]
    @Binding var balance: Int
    
    var body: some View {
        List{
            ForEach(payList, id: \.self) { spend in
                HStack{
                    Text("\(spend.name ?? "")")
                    Spacer()
                    Text("\(spend.money ?? 0)")
                    Image(systemName: "checkmark")
                        .onTapGesture {
                            //ИСПРАВИТЬ
                            balance -= spend.money ?? 0
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
            payList.remove(atOffsets: offsets)
        }
    }
}

//struct SpendplanListScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SpendplanListScreen()
//    }
//}
