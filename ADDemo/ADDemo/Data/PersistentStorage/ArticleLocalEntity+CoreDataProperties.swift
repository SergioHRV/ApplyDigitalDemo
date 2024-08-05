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
    
    static func saveArticles(articles: [Article],
                             using managedObjectContext: NSManagedObjectContext) {
        for article in articles {
            let newArticle = ArticleLocalEntity(context: managedObjectContext)
            newArticle.id = article.id
            newArticle.title = article.title
            newArticle.author = article.author
            newArticle.createdAt = article.createdAt
            newArticle.url = article.articleUrl
        }
        do {
            try managedObjectContext.save()
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    static func sortedFetchRequest(using managedObjectContext: NSManagedObjectContext) -> [ArticleLocalEntity] {
        let request = NSFetchRequest<ArticleLocalEntity>(entityName: "ArticleLocalEntity");
        let dateSortDescription = NSSortDescriptor(key: "createdAt", ascending: false)
        request.sortDescriptors = [dateSortDescription]
        
        do {
            return try managedObjectContext.fetch(request)
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
            return []
        }
    }
    
    static func deleteAll(using managedObjectContext: NSManagedObjectContext) throws {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ArticleLocalEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try managedObjectContext.execute(deleteRequest)
    }
}

extension ArticleLocalEntity : Identifiable {

}
