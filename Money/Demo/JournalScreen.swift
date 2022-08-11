//
//  JournalScreen.swift
//  Money
//
//  Created by Артем Черненко on 11.08.2022.
//

import SwiftUI

struct JournalScreen: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Journal.date, ascending: true)])
    private var journal: FetchedResults<Journal>
    
    var body: some View {
        //date.formatted(.dateTime.day().month().year())
        List{
            ForEach(journal) { pay in
                HStack{
                    Text("\(pay.name ?? "")")
                    Spacer()
                    Text("\(pay.money) руб")
                }
            }
            .onDelete(perform: deleteItems)
        }
        .listStyle(.inset)
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { journal[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct JournalScreen_Previews: PreviewProvider {
    static var previews: some View {
        JournalScreen()
    }
}
