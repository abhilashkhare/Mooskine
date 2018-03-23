//
//  DataController.swift
//  Mooskine
//
//  Created by Abhilash Khare on 3/22/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController{
    let persistentContainer : NSPersistentContainer
    
    init(modelName : String)    {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    var viewContext : NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    func load( completion : (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
        completion?()
        }
    }
    
}
