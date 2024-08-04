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
    
    @NSManaged public var id: String
    @NSManaged public var title: String
    @NSManaged public var author: String
    @NSManaged public var createdAt: Date
    @NSManaged public var url: String?
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleLocalEntity> {
        return NSFetchRequest<ArticleLocalEntity>(entityName: "ArticleLocalEntity")
    }
    
    static func createWith(id: String,
                           title: String,
                           author: String,
                           createdAtDate: Date,
                           url: String?,
                           using managedObjectContext: NSManagedObjectContext) {
        
        let article = ArticleLocalEntity(context: managedObjectContext)
        article.id = id
        article.title = title
        article.author = author
        article.createdAt = createdAtDate
        article.url = url
        do {
            try managedObjectContext.save()
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    static func sortedFetchRequest(using managedObjectContext: NSManagedObjectContext) -> [ArticleLocalEntity] {
        let request = NSFetchRequest<ArticleLocalEntity>(entityName: "ArticleLocalEntity");
        let dateSortDescription = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [dateSortDescription]
        
        do {
            return try managedObjectContext.fetch(request)
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
            return []
        }
    }
}

extension ArticleLocalEntity : Identifiable {

}
