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
    
}

extension DeleteArticleIDLocalEntity : Identifiable {

}
