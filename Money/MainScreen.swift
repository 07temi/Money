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
    @State private var average = UserDefaults.standard.integer(forKey: "Average")
    
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
            HStack {
                Text("Тут дата!")
                Text("\(average)")
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
                Spacer()
                ExpandableButtonPanel(primaryItem: ExpandableButtonItem(label: Text("➕").font(.system(size: 40))), secondaryItems: [
                    ExpandableButtonItem(label: Text("📝").font(.system(size: 40))) {
                        journal.toggle()
                    },
                    ExpandableButtonItem(label: Text("📆").font(.system(size: 40))) {
                        payToday.toggle()
                    },
                    ExpandableButtonItem(label: Text("💸").font(.system(size: 40))) {
                        addPayList.toggle()
                    }
                ])
                .padding()
            }
            .padding(5)
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
        
        .sheet(isPresented: $addPayList){
            AddPayListItem()
        }
        
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
