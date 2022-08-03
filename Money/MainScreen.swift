//
//  MainScreen.swift
//  Money
//
//  Created by Артем Черненко on 02.08.2022.
//

import SwiftUI

struct MainScreen: View {
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
            Text("тут список трат")
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
