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

    @NSManaged public var id: String?
    
    static func saveArticleId(articleId: String,
                             using managedObjectContext: NSManagedObjectContext) {
        let newArticle = DeleteArticleIDLocalEntity(context: managedObjectContext)
        newArticle.id = articleId
        do {
            try managedObjectContext.save()
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    static func basicFetchRequest(using managedObjectContext: NSManagedObjectContext) -> [DeleteArticleIDLocalEntity] {
        let request = NSFetchRequest<DeleteArticleIDLocalEntity>(entityName: "DeleteArticleIDLocalEntity");
        do {
            return try managedObjectContext.fetch(request)
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
            return []
        }
    }
}

extension DeleteArticleIDLocalEntity : Identifiable {

}
