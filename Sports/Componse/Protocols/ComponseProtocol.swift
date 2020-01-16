//
//  ComponseProtocol.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import Foundation

protocol ComponseProtocol {
    
    associatedtype Object
    
    func insert(_ obj: Object, index: Int)
}

protocol ComponseIndexProtocol {
    
    var index: Int { get set }
}
