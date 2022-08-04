//
//  SpendplanListScreen.swift
//  Money
//
//  Created by Артем Черненко on 04.08.2022.
//

import SwiftUI

struct SpendplanListScreen: View {
    private var spendList = [1,2,3,4,5]
    var body: some View {
        List(spendList, id: \.self){ spend in
            Text("\(spend)")
        }
    }
}

struct SpendplanListScreen_Previews: PreviewProvider {
    static var previews: some View {
        SpendplanListScreen()
    }
}
