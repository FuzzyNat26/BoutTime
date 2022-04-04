//
//  PriorityItem+CoreDataProperties.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//
//

import Foundation
import CoreData


extension PriorityItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PriorityItem> {
        return NSFetchRequest<PriorityItem>(entityName: "PriorityItem")
    }

    @NSManaged public var priorityPoint: Int32
    @NSManaged public var priorityCreatedDate: Date?
    @NSManaged public var priorityFinishedDate: Date?
    @NSManaged public var priorityId: UUID?
    @NSManaged public var priorityIsChecked: Bool
    @NSManaged public var priorityTitle: String?
    @NSManaged public var priorityUrgencyLevel: String?

}

extension PriorityItem : Identifiable {

}
