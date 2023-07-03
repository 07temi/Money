//
//  DateFrame.swift
//  Money
//
//  Created by Артем Черненко on 24.02.2023.
//

import SwiftUI

struct DateFrame: View {
    let currentDate = Date.now
    
    var body: some View {
        VStack{
            Text("Сегодня")
            HStack{
                Text("24")
                Text("Февраля")
                Text("\(getMonthName())")
            }
        }
    }
    
    private func getMonthName() -> String {
        //        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "LLLL"
        //        let monthString = dateFormatter.string(from: currentDate)
        //        return monthString
        return "month"
    }
}

struct DateFrame_Previews: PreviewProvider {
    static var previews: some View {
        DateFrame()
    }
}
