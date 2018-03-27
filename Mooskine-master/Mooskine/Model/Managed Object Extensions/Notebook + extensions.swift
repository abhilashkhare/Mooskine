//
//  Notebook + extensions.swift
//  Mooskine
//
//  Created by Abhilash Khare on 3/25/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import CoreData

extension Notebook{
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
