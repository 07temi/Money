//
//  SpendplanListScreen.swift
//  Money
//
//  Created by Артем Черненко on 04.08.2022.
//

import SwiftUI

struct SpendplanListScreen: View {
   // @State var spendList = ["Строка 1","Строка 2","Строка 3","Строка 4","Строка 5"]
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var payList: [PayList]
    @Binding var balance: Int
    @State var colorState = UIColor(.green)
    
    var body: some View {
        List{
            ForEach(payList, id: \.self) { spend in
                HStack{
                    Text("\(spend.name ?? "")")
                    Spacer()
                    Text("\(spend.money ?? 0)")
                    Image(systemName: "checkmark")
                        .onTapGesture {
                            if spend.isDone != true {
                                balance -= spend.money ?? 0
                                addJournalItem(money: spend.money ?? 0, name: spend.name ?? "error")
//                                spend.isDone?.toggle()
//                                Не работает изменение признака активности
                            }
                        }
                        .foregroundColor(Color(colorState))
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
    
    
    private func addJournalItem(money: Int, name: String) {
        let newJournal = Journal(context: viewContext)
        
        newJournal.date = Date()
        newJournal.name = name
        newJournal.money = Int64(money)
//        newJournal.dateToJournal = operationDate
//        viewContext.refreshAllObjects()
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
}

//struct SpendplanListScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SpendplanListScreen()
//    }
//}
