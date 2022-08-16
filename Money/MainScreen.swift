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
    @State private var addBalance = false
    @State private var addPayList = false
    @State private var journal = false
    @State var plusType = true
    
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
                Button(action: {plusType = true
                                addBalance.toggle()
                                }) {
                        Image(systemName: "plus.circle")
                                        .resizable()
                                        .frame(width: 26, height: 26)
                    }
                
                Text("\(balance)")
                    .font(.system(size: 26))
                
                Button(action: {plusType = false
                                addBalance.toggle()
                    }) {
                    Image(systemName: "minus.circle")
                            .resizable()
                            .frame(width: 26, height: 26)
                }
            }
            .padding(.bottom)
            SpendplanListScreen(balance: $balance)
            Spacer()
            Button("journal", action: {journal.toggle()})
            Button("bottom button", action: {addPayList.toggle()})
                .padding(5)
        }
        .sheet(isPresented: $addPayList){
            AddPayListItem()
        }
        
        .sheet(isPresented: $addBalance){
            AddBalanceScreen(balance: $balance, operation: plusType)
        }
        
        .sheet(isPresented: $journal) {
            JournalScreen()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
