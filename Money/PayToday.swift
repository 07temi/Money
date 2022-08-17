//
//  PayToday.swift
//  Money
//
//  Created by Артем Черненко on 17.08.2022.
//

import CoreData

//import Foundation
//import SwiftUI
//import CoreData
//
//struct PayTodayData {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(sortDescriptors: [])
//    private var payList: FetchedResults<PayList>
//
//    @State var active: [PayList] = []
//
//    func getPaysForDay() -> [PayList]{
//        for pay in payList {
//            if !pay.isDone {
////              Список незавершенных платежей общий
//                print("\(pay.name ?? "")")
//                active.append(pay)
//
////              Список платежей с истекшим сроком
//
////              Список Ежедневных
////              Список Еженедельных
////              Список Ежемесячных
//            }
//        }
//        return active
//    }
//}
class PayTodayData {
    static let shared = PayTodayData()
    
    let viewContext: NSManagedObjectContext
    
    private init() {}
}
