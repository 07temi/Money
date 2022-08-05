//
//  SpendplanListScreen.swift
//  Money
//
//  Created by Артем Черненко on 04.08.2022.
//

import SwiftUI

struct SpendplanListScreen: View {
    @State var spendList = [1,2,3,4,5]
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
                }
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
