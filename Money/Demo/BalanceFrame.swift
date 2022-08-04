//
//  BalanceFrame.swift
//  Money
//
//  Created by Артем Черненко on 04.08.2022.
//

import SwiftUI

struct BalanceFrame: View {
    
    @State var balance: Int
    @State private var color = Color(.red)
    
    var body: some View {
        VStack{
            Text("\(balance)")
                .font(.system(size: 26))
            HStack{
                Button("Plus") {
                    print("plus action")
                }
                .padding()
                Spacer()
                Button("Minus") {
                    print("minus action")
                }
                .padding()
            }
        }
    }
}

struct BalanceFrame_Previews: PreviewProvider {
    static var previews: some View {
        BalanceFrame(balance: 999999123567)
    }
}
