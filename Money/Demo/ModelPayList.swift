//
//  ModelPayList.swift
//  Money
//
//  Created by Артем Черненко on 10.08.2022.
//

struct PayList: Decodable, Hashable {
    let name: String?
    let money: Int?
    
    var description: String {
        """
    Name: \(name ?? "")
    Sum: \(money ?? 0)
    """
    }
    //var descriptionLinesCount = 5

    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    init(payListDemo: [String: Any]) {
        name = payListDemo["name"] as? String
        money = payListDemo["money"] as? Int
    }
    
    static func getDemoList() -> [PayList] {
        [PayList(name: "Телефон", money: 890),
        PayList(name: "Интернет", money: 1200),
        PayList(name: "Еда коту", money: 4000),
        PayList(name: "Элетричество", money: 1500),
        PayList(name: "Хуичество", money: 733)]
    }
    
//    static func getPayList(from value: Any) -> [PayList] {
//        guard let payListDemo = value as? [[String: Any]] else { return [] }
//        return payListDemo.compactMap { PayList(payListDemo: $0)}
//    }
}

