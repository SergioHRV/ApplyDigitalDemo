//
//  PersistenceController.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for i in 1...3 {
            let newArticle = ArticleLocalEntity(context: viewContext)
            newArticle.id = "ADDEMO0" + String(i)
            newArticle.title = "ADDEMO as a testing prject"
            newArticle.author = "SRamirez"
            newArticle.createdAt = Date()
            newArticle.url = nil
        }
        
        let newDeletedId = DeleteArticleIDLocalEntity(context: viewContext)
        newDeletedId.id = "ADDEMO01"
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            print("Unresolved Error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ADDemo")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.name = "viewContext"
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
    }
    
    func saveBatchArticles(from articles: [Article]) async throws {
        let taskContext = backgroudTaskContext()
        taskContext.name = "saveContext"
        taskContext.transactionAuthor = "saveArticles"
        
        try taskContext.performAndWait {
            let batchInsertRequest = createBatchInsertArticleRequest(from: articles)
            if let fetchResult = try? taskContext.execute(batchInsertRequest),
               let batchInsertResult = fetchResult as? NSBatchInsertResult,
               let success = batchInsertResult.result as? Bool, success {
                return
            } else {
                throw PersistenceError.batchInsertError
            }
        }
        
        try taskContext.save()
    }
    
    func deleteAllArticles() async throws {
        let taskContext = backgroudTaskContext()
        taskContext.name = "saveContext"
        taskContext.transactionAuthor = "deleteArticles"
        
        try taskContext.performAndWait {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ArticleLocalEntity")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            try taskContext.execute(deleteRequest)
        }
    }
    
    func getAllArticles() async throws -> [ArticleLocalEntity] {
        let taskContext = backgroudTaskContext()
        taskContext.name = "saveContext"
        taskContext.transactionAuthor = "getArticles"
        
        let request = NSFetchRequest<ArticleLocalEntity>(entityName: "ArticleLocalEntity")
        let dateSortDescription = NSSortDescriptor(key: "createdAt", ascending: false)
        request.sortDescriptors = [dateSortDescription]
        return try taskContext.fetch(request)
    }
    
    func saveArticleId(articleId: String) async throws {
        let taskContext = backgroudTaskContext()
        taskContext.name = "saveContext"
        taskContext.transactionAuthor = "saveDeletedArticleId"
        
        taskContext.performAndWait {
            let newArticle = DeleteArticleIDLocalEntity(context: taskContext)
            newArticle.id = articleId
        }
        try taskContext.save()
    }
    
    func getDeletedArticleIds() async throws -> [DeleteArticleIDLocalEntity] {
        let taskContext = backgroudTaskContext()
        taskContext.name = "saveContext"
        taskContext.transactionAuthor = "getDeletedArticleId"
        
        let request = NSFetchRequest<DeleteArticleIDLocalEntity>(entityName: "DeleteArticleIDLocalEntity");
        return try taskContext.fetch(request)
    }
    
    func deleteAllIds() async throws {
        let taskContext = backgroudTaskContext()
        taskContext.name = "saveContext"
        taskContext.transactionAuthor = "deleteArticles"
        
        try taskContext.performAndWait {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "DeleteArticleIDLocalEntity")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            try taskContext.execute(deleteRequest)
        }
    }
}

extension PersistenceController {
    private func backgroudTaskContext() -> NSManagedObjectContext {
        let taskContext = container.newBackgroundContext()
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return taskContext
    }
    
    private func createBatchInsertArticleRequest(from articles: [Article]) -> NSBatchInsertRequest {
        var index = 0
        let total = articles.count
        
        let batchInsertRequest = NSBatchInsertRequest(entity: ArticleLocalEntity.entity(), dictionaryHandler: { dictionary in
            guard index < total else { return true }
            dictionary.addEntries(from: articles[index].dictionaryValue as [AnyHashable: Any])
            index += 1
            return false
        })
        return batchInsertRequest
    }
}
