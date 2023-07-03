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
            Text("Сегодня:")
                .padding(.leading)
            HStack{
                Text("\(getMonthName())")
                    //.font(.title2)
            }
        }
    }
    
    private func getMonthName() -> String {
        var monthName = ""
        let myCalendar = Calendar(identifier: .gregorian)
        let components = myCalendar.dateComponents([.day, .month], from: Date())
        let dayNumber = components.day
        let monthNumber = components.month
        
        monthName = "\(dayNumber ?? 00)"
        
        switch monthNumber {
        case 1: monthName += " Января"
        case 2: monthName += " Февраля"
        case 3: monthName += " Марта"
        case 4: monthName += " Апреля"
        case 5: monthName += " Мая"
        case 6: monthName += " Июня"
        case 7: monthName += " Июля"
        case 8: monthName += " Августа"
        case 9: monthName += " Сентября"
        case 10: monthName += " Октября"
        case 11: monthName += " Ноября"
        case 12: monthName += " Декабря"
        default:
            monthName = "error"
        }
        return monthName
    }
}

struct DateFrame_Previews: PreviewProvider {
    static var previews: some View {
        DateFrame()
    }
}
