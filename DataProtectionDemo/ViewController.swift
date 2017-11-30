//
//  ViewController.swift
//  DataProtectionDemo
//
//  Created by Manolescu Mihai Alexandru on 30/11/2017.
//  Copyright © 2017 Manolescu Mihai Alexandru. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class ViewController: UIViewController
{

    func initializeStartUp()
    {
        let keyAsString = "hellohellohellohellohellohellohellohellohellohellohellohellohell"
        var key = Data(count: 64)
        key = keyAsString.data(using: String.Encoding.utf8)!
        
        CDManipulator.setKey(key)
        
        let encryptionConfig = Realm.Configuration(encryptionKey: key)
        
        do {
            let realm = try Realm(configuration: encryptionConfig)
            // At this point we have access to the database:
            
                                    try! realm.write()
                                    {
                                        let newCard = Card()
                                        newCard.name = "heeeeeeey"
                                        newCard.text = "encryption"
            
                                        realm.add(newCard)
                                    }
            
            let cards = realm.objects(Card.self)
            
            print("Number of cards: ", cards.count)
            
            for card in cards
            {
                print("card: ",card)
            }
        }catch let error as NSError
        {
            fatalError("Error \(error)")
        }

    }
    
    func regularAccess()
    {
        let key = CDManipulator.getKey()
        
        let encryptionConfig = Realm.Configuration(encryptionKey: key)
        
        // Attempt to open the encrypted Realm
        do {
            let realm = try Realm(configuration: encryptionConfig)
            // At this point we have access to the database:
            
            //                        try! realm.write()
            //                        {
            //                            let newCard = Card()
            //                            newCard.name = "heeeeeeey"
            //                            newCard.text = "encryption"
            //
            //                            realm.add(newCard)
            //                        }
            
            let cards = realm.objects(Card.self)
            
            print("Number of cards: ", cards.count)
            
            for card in cards
            {
                print("card: ",card)
            }
        }catch let error as NSError
        {
            fatalError("Error \(error)")
        }

    }
    
    
    override func viewDidLoad()
    {
//        print("#Current adress of the file: \(Realm.Configuration.defaultConfiguration.fileURL!)")
//        
//        if(App.isItTheFirstRun())
//         {
//            initializeStartUp()
//         }
//        else
//         {
//            regularAccess()
//         }
//        
//        
//        var specificString = String(data: CDManipulator.getKey(), encoding: String.Encoding.utf8) as String!
//        
//        print("\n Key as string: \(specificString)")
        
        
        let word = App.generateRandomBytes()
        
        print(word)
        
        
        
        super.viewDidLoad()
    }



}

