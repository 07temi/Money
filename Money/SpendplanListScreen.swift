//
//  SpendplanListScreen.swift
//  Money
//
//  Created by Артем Черненко on 04.08.2022.
//

import SwiftUI

struct SpendplanListScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var payList: FetchedResults<PayList>
    
    @Binding var balance: Int64
    @State var colorState = UIColor(.green)
    let currentDate = Date()
     
    var body: some View {
        List{
            ForEach(payList, id: \.self) { spend in
                HStack{
                    Text("\(spend.name ?? "")")
                    Spacer()
                    Text("\(spend.money)")
                    Image(systemName: "checkmark")
                        .onTapGesture {
                            if spend.isDone != true {
                                balance -= spend.money
                                addJournalItem(money: spend.money, name: spend.name ?? "error")
                                changeState(pay: spend)

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
    
    func changeState(pay: PayList){
        pay.isDone.toggle()
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { payList[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func addJournalItem(money: Int64, name: String) {
        let newJournal = Journal(context: viewContext)
       
        newJournal.name = name
        newJournal.money = Int64(money)
        newJournal.date = Date()
        newJournal.typeIsPlus = false

        //        newJournal.journalToDate = currentDate
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
