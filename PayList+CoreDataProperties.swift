//
//  PayList+CoreDataProperties.swift
//  Money
//
//  Created by Артем Черненко on 24.08.2022.
//
//

import Foundation
import CoreData
import SwiftUI


extension PayList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PayList> {
        return NSFetchRequest<PayList>(entityName: "PayList")
    }

    @NSManaged public var isDone: Bool
    @NSManaged public var money: Int64
    @NSManaged public var name: String?

}

extension PayList : Identifiable {

}
