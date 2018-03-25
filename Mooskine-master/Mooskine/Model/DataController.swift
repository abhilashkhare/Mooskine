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
            self.autoSaveViewContext(interval: 30)
        completion?()
        }
    }
    
}

extension DataController {
    func autoSaveViewContext(interval : TimeInterval = 30){
        print("Autosaving")
        guard interval > 0 else{
            print("Can't set negative autosave interval")
            return
        }
        if viewContext.hasChanges{
            try? viewContext.save()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext(interval : interval)
        }
        
    }
    
    
}
