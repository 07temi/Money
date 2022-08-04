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
    @State private var minus = true
    
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
            Text("\(balance)")
            
            HStack{
                Button(action: {minus = false
                                addBalance.toggle()
                                }) {
                        Image(systemName: "plus.circle")
                    }
                
                Button(action: {minus = true
                                addBalance.toggle()
                    }) {
                    Image(systemName: "minus.circle")
                }
            }
            Text("тут список трат")
        }
        .sheet(isPresented: $addBalance){
            AddBalanceScreen(balance: $balance, minus: minus)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
