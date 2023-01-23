//
//  ActivePaysToday.swift
//  Money
//
//  Created by Артем Черненко on 17.08.2022.
//

import SwiftUI

struct ActivePaysToday: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var payList: FetchedResults<PayList>
    
    let currentDate = Date.now
    var shortDate: String {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy"
        return df.string(from: currentDate)
    }
    
    var pays: [PayList] { return
        payList.filter { pay in
            pay.isDone == false
        }
    }
    var body: some View {
        List{
            ForEach(pays) { pay in
                Text("\(pay.name ?? "") \(shortDate)")
            }
        }
    }
}

struct ActivePaysToday_Previews: PreviewProvider {
    static var previews: some View {
        ActivePaysToday()
    }
}
