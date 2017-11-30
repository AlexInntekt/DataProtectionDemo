//
//  RealmController.swift
//  DataProtectionDemo
//
//  Created by Manolescu Mihai Alexandru on 30/11/2017.
//  Copyright © 2017 Manolescu Mihai Alexandru. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import CoreData

//MODEL:
class Card: Object
{
    dynamic var name = ""
    dynamic var text = ""
}
