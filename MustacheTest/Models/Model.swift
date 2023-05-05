//
//  Model.swift
//  MustacheTest
//
//  Created by Colstin Donaldson on 5/5/23.
//

import Foundation
import SwiftUI

class Model: ObservableObject{
    
    var toggtleScene1 = Mustache1.self
    var toggtleScene2 = Mustache2.self
    var toggtleScene3 = Mustache3.self
    
    var toggleArray :[Any] = [Mustache1.self, Mustache2.self, Mustache3.self]
}
