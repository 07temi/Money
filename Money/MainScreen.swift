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
    
    @State private var balance: Int64 = 0
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
                Button(action: {}) {
                    Image(systemName: "arrowtriangle.left")
                        .foregroundColor(.black)
                }
                
                Text("Тут дата!")
                Button(action: {}) {
                    Image(systemName: "arrowtriangle.right")
                        .foregroundColor(.black)
                }
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
            //temp
            Button("Оплаты сегодня", action: {payToday.toggle()})
            //****************
            Button("Журнал", action: {journal.toggle()})
            Button("Запланировать расход", action: {addPayList.toggle()})
                .padding(5)
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
        //hhhhhhhhhh
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
