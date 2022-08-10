//
//  MainScreen.swift
//  Money
//
//  Created by Артем Черненко on 02.08.2022.
//

import SwiftUI

struct MainScreen: View {
    
//    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(sortDescriptors: [])
//    private var money: FetchedResults<MoneyToday>
    @State private var balance = 0
    //private var date = Date()
    @State private var addBalance = false
    @State private var addPayList = false
    @State var operation = ""
    @State var payList = PayList.getDemoList()
    
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
                Button(action: {operation = "plus"
                                addBalance.toggle()
                                }) {
                        Image(systemName: "plus.circle")
                                        .resizable()
                                        .frame(width: 26, height: 26)
                    }
                
                Text("\(balance)")
                    .font(.system(size: 26))
                
                Button(action: {operation = "minus"
                                addBalance.toggle()
                    }) {
                    Image(systemName: "minus.circle")
                            .resizable()
                            .frame(width: 26, height: 26)
                }
            }
            .padding(.bottom)
            //Group{
            SpendplanListScreen(payList: $payList, balance: $balance)
            //}
            Spacer()
            Button("bottom button", action: {addPayList.toggle()})
                .padding(5)
        }
        .sheet(isPresented: $addPayList){
            AddPayListItem(payList: $payList)
        }
        
        .sheet(isPresented: $addBalance){
            AddBalanceScreen(balance: $balance, operation: operation)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
