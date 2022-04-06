//
//  PrioritySortDescriptiors.swift
//  BoutTime
//
//  Created by Jonathan Lee on 05/04/22.
//

import Foundation
//
//let prioritySortDescriptors = [
//    NSSortDescriptor(keyPath: \PriorityItem.priorityPoint, ascending: false),
//    NSSortDescriptor(keyPath: \PriorityItem.priorityTitle, ascending: true),
//    NSSortDescriptor(keyPath: \PriorityItem.priorityFinishedDate, ascending: true),
//    NSSortDescriptor(keyPath: \PriorityItem.priorityCreatedDate, ascending: true)
//]

let prioritySortDescriptors = [
    [
        NSSortDescriptor(keyPath: \PriorityItem.priorityPoint, ascending: false),
        NSSortDescriptor(keyPath: \PriorityItem.priorityTitle, ascending: true),
        NSSortDescriptor(keyPath: \PriorityItem.priorityFinishedDate, ascending: true),
        NSSortDescriptor(keyPath: \PriorityItem.priorityCreatedDate, ascending: true)
    ],
    [
        NSSortDescriptor(keyPath: \PriorityItem.priorityTitle, ascending: true),
        NSSortDescriptor(keyPath: \PriorityItem.priorityPoint, ascending: false),
        NSSortDescriptor(keyPath: \PriorityItem.priorityFinishedDate, ascending: true),
        NSSortDescriptor(keyPath: \PriorityItem.priorityCreatedDate, ascending: true)
    ],
    [
        NSSortDescriptor(keyPath: \PriorityItem.priorityFinishedDate, ascending: true),
        NSSortDescriptor(keyPath: \PriorityItem.priorityPoint, ascending: false),
        NSSortDescriptor(keyPath: \PriorityItem.priorityTitle, ascending: true),
        NSSortDescriptor(keyPath: \PriorityItem.priorityCreatedDate, ascending: true)
    ],
    [
        NSSortDescriptor(keyPath: \PriorityItem.priorityCreatedDate, ascending: true),
        NSSortDescriptor(keyPath: \PriorityItem.priorityPoint, ascending: false),
        NSSortDescriptor(keyPath: \PriorityItem.priorityTitle, ascending: true),
        NSSortDescriptor(keyPath: \PriorityItem.priorityFinishedDate, ascending: true)
    ]
]
