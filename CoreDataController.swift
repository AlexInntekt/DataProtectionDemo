//
//  CoreDataController.swift
//  DataProtectionDemo
//
//  Created by Manolescu Mihai Alexandru on 30/11/2017.
//  Copyright © 2017 Manolescu Mihai Alexandru. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CDManipulator
{
    //    class declaration for coredata:
    //    class:  StoredKey
    //    attribute: binaryData
    
    //MARK: Write
    func setKey(_ keyToStore: Data)
    {
        print("\nCDManipulator message: setKey() being called\n")
        clean()
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let aKeyInstance = StoredKey(context: context)
        
        aKeyInstance.binaryData = keyToStore as NSData
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    
    //MARK: Fetching the last key stored
    func getKey() -> Data
    {
        print("\nCDManipulator message: getKey() being called\n")
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var fetchedKeys: [StoredKey] = []
        
        var returnedKey = Data()
        
        do
        {
            fetchedKeys = try context.fetch(StoredKey.fetchRequest()) as! [StoredKey]
            print("Fecthed key: ", fetchedKeys)
        }
        catch{}
        
        
        for instance in fetchedKeys
        {
            returnedKey = instance.binaryData as! Data
        }
        
        print("The number of keys stored with CoreData is \(fetchedKeys.count)")
        
        if (fetchedKeys.count > 1)
        {
            print("\n\n!!!ERROR!!! label: g38924hgo3qg4893h4g\n")
            
        }
        
        return returnedKey
        
    }
    
    //MARK: cleaning the key storer:
    func clean()
    {
        print("\nCDManipulator message: clean() being called\n")
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var fetchedKeys: [StoredKey] = []
        
        do
        {
            fetchedKeys = try context.fetch(StoredKey.fetchRequest()) as! [StoredKey]
        }
        catch{}
        
        for instance in fetchedKeys
        {
            
            print("Deleting instance: ", instance)
            
            context.delete(instance)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        
    }
    
}
