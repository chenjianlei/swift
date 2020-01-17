//
//  FriendComponentsFactory.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/17.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import Foundation

class FriendComponentsFactory {
    
    var sections = [M80TableViewSectionComponent]()
    
    init() {
        makeInitSubviews()
    }
    
    private func makeInitSubviews() {
        let sectionOne = SPFriendSectionOne()
        let sectionOneRowOne = SPFriendCycleCellComponent()
        sectionOne.addComponents([sectionOneRowOne])
        sections.append(sectionOne)
    }
}
