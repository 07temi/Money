//
//  MainScreen.swift
//  Money
//
//  Created by Артем Черненко on 02.08.2022.
//

import SwiftUI

struct MainScreen: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var payList: FetchedResults<PayList>
    
    @State private var balance = Int64( UserDefaults.standard.integer(forKey: "Balance"))
    //private var date = Date()
    @State private var plusBalance = false
    @State private var minusBalance = false
    @State private var addPayList = false
    @State private var journal = false
    //temp
    @State private var payToday = false
    //*************
    @State var plusType = false
    
    var body: some View {
        VStack{
            HStack{
//                Button(action: {}) {
//                    Image(systemName: "arrowtriangle.left")
//                        .foregroundColor(.black)
//                }
                
                Text("Тут дата!")
//                Button(action: {}) {
//                    Image(systemName: "arrowtriangle.right")
//                        .foregroundColor(.black)
//                }
            }
            .padding(.bottom)
            .padding(.top)
            
            HStack{
                Button(action: {plusBalance.toggle()
                                }) {
                        Image(systemName: "plus.circle")
                                        .resizable()
                                        .frame(width: 26, height: 26)
                    }
                
                Text("\(balance)")
                    .font(.system(size: 26))
                    .onTapGesture {
                        journal.toggle()
                    }
                
                Button(action: {minusBalance.toggle()
                    }) {
                    Image(systemName: "minus.circle")
                            .resizable()
                            .frame(width: 26, height: 26)
                }
            }
            .padding(.bottom)
            SpendplanListScreen(balance: $balance)
            Spacer()
            
            HStack{
                //журнал
                //Button("Журнал", action: {journal.toggle()})
                Image(systemName: "checklist")
                    //.resizable()
                    .clipShape(Rectangle())
                    .frame(width: 90, height: 30)
                    .onTapGesture {
                        journal.toggle()
                    }
                    .padding()
                    .background(Color .green)
                    .foregroundColor(.blue)

                //запланировать
                Image(systemName: "text.badge.plus")
                    //.resizable()
                    .clipShape(Rectangle())
                    .frame(width: 40, height: 50)
                    .onTapGesture {
                        addPayList.toggle()
                    }
                    .padding(.horizontal, 50)
                    .foregroundColor(.blue)

                //на сегодня
                //Button("Оплаты сегодня", action: {payToday.toggle()})
                Image(systemName: "clock.badge.exclamationmark")
                    //.resizable()
                    .clipShape(Rectangle())
                    .frame(width: 90, height: 30)
                    .onTapGesture {
                        payToday.toggle()
                    }
                    .padding()
                    .background(Color .red)
                    .foregroundColor(.blue)
            }
//            Button("Запланировать расход", action: {addPayList.toggle()})
//                .padding(5)
        }
        .sheet(isPresented: $addPayList){
            AddPayListItem()
        }
        
        .sheet(isPresented: $plusBalance){
            PlusBalanceScreen(balance: $balance)
        }
        
        .sheet(isPresented: $minusBalance){
            MinusBalanceScreen(balance: $balance)
        }
        
        .sheet(isPresented: $journal) {
            JournalScreen()
        }
        
        .sheet(isPresented: $payToday) {
            ActivePaysToday()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
