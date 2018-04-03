//
//  Cat.swift
//  AdvancedCollectionView
//
//  Created by Shawn Moore on 4/2/18.
//  Copyright © 2018 Shawn Moore. All rights reserved.
//

import Foundation

struct Cat: Codable {
    static let favoriteToggledNotificationName = NSNotification.Name("AAPLCatFavoriteToggledNotificationName")
    
    var name: String
    var uniqueID: String
    var shortDescription: String
    var conservationStatus: String?
    var classificationKingdom: String?
    var classificationPhylum: String?
    var classificationClass: String?
    var classificationOrder: String?
    var classificationFamily: String?
    var classificationGenus: String?
    var classificationSpecies: String?
    var favorite: Bool {
        didSet {
            guard favorite != oldValue else { return }
            
            NotificationCenter.default.post(name: Cat.favoriteToggledNotificationName, object: self)
        }
    }
    
    static var allCatsTable: [String: Cat] = [:]
    
    mutating func update(from cat: Cat) {
        if cat.uniqueID != self.uniqueID {
            self.uniqueID = cat.uniqueID
        }
        
        if cat.name != self.name {
            self.name = cat.name
        }
        
        if cat.favorite != self.favorite {
            self.favorite = cat.favorite
        }
        
        self.shortDescription = cat.shortDescription
        self.conservationStatus = cat.conservationStatus
        self.classificationKingdom = cat.classificationKingdom
        self.classificationPhylum = cat.classificationPhylum
        self.classificationClass = cat.classificationClass
        self.classificationOrder = cat.classificationOrder
        self.classificationFamily = cat.classificationFamily
        self.classificationGenus = cat.classificationGenus
        self.classificationSpecies = cat.classificationSpecies
        
    }
}
