//
//  ArticleLocalEntity+CoreDataProperties.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//
//

import Foundation
import CoreData


extension ArticleLocalEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleLocalEntity> {
        return NSFetchRequest<ArticleLocalEntity>(entityName: "ArticleLocalEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var author: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var url: String?

}

extension ArticleLocalEntity : Identifiable {

}
