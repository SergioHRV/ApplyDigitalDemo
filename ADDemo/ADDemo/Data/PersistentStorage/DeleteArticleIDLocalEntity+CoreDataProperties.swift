//
//  DeleteArticleIDLocalEntity+CoreDataProperties.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//
//

import Foundation
import CoreData


extension DeleteArticleIDLocalEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeleteArticleIDLocalEntity> {
        return NSFetchRequest<DeleteArticleIDLocalEntity>(entityName: "DeleteArticleIDLocalEntity")
    }

    @NSManaged public var id: String?

}

extension DeleteArticleIDLocalEntity : Identifiable {

}
