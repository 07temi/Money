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
                VStack{
                    Text("\(getMonthName().dName)")
                        .padding(.leading)
                    Text("\(getMonthName().mName)")
                        .padding(.leading)
                    //.font(.title2)
                }
            }
        }
    }
    
    private func getMonthName() -> (mName: String, dName: String) {
        var monthName = ""
        var dayName = ""
        let myCalendar = Calendar(identifier: .gregorian)
        let components = myCalendar.dateComponents([.day, .month, .weekday], from: Date())
        let dateDay = components.day
        let monthNumber = components.month
        let dayWeekNumber = components.weekday
        
        monthName = "\(dateDay ?? 00)"
        
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
                
        switch dayWeekNumber {
        case 2: dayName = "Понедельник"
        case 3: dayName = "Вторник"
        case 4: dayName = "Среда"
        case 5: dayName = "Четверг"
        case 6: dayName = "Пятница"
        case 7: dayName = "Суббота"
        case 1: dayName = "Воскресенье"
        default:
            monthName = "error"
        }
        
        return (monthName, dayName)
    }
}

struct DateFrame_Previews: PreviewProvider {
    static var previews: some View {
        DateFrame()
    }
}
