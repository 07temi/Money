//
//  ModelPayList.swift
//  Money
//
//  Created by Артем Черненко on 10.08.2022.
//

struct PayList: Decodable, Hashable {
    let name: String?
    let money: Int?
    var isDone: Bool?
    
//    var description: String {
//        """
//    Name: \(name ?? "")
//    Sum: \(money ?? 0)
//    """
//    }
    //var descriptionLinesCount = 5

    init(name: String, money: Int, isDone: Bool) {
        self.name = name
        self.money = money
        self.isDone = isDone
    }
    
    init(payListDemo: [String: Any]) {
        name = payListDemo["name"] as? String
        money = payListDemo["money"] as? Int
        isDone = payListDemo["isDone"] as? Bool
    }
    
    static func getDemoList() -> [PayList] {
        [PayList(name: "Телефон", money: 890, isDone: false),
         PayList(name: "Интернет", money: 1200, isDone: false),
        PayList(name: "Еда коту", money: 4000, isDone: false),
        PayList(name: "Элетричество", money: 1500, isDone: false),
        PayList(name: "Хуичество", money: 733, isDone: false)]
    }
    
//    static func getPayList(from value: Any) -> [PayList] {
//        guard let payListDemo = value as? [[String: Any]] else { return [] }
//        return payListDemo.compactMap { PayList(payListDemo: $0)}
//    }
}

