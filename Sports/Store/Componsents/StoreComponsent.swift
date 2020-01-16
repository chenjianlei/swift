//
//  StoreComponsent.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import Foundation
import M80TableViewComponent

extension StoreComponentFactory: EventDelegate {
    func onEvent(_ obj: EventObj) {
        if obj.name == "a" {
            print("---- this is factory")
            print(obj.params as Any)
        } else {
            self.delegate?.onEvent(obj)
        }
    }
}

class StoreComponentFactory {
    var sections = [M80TableViewSectionComponent]()
    var delegate: EventDelegate?
    
    init() {
        makeInitSubviews()
    }
    
    private func makeInitSubviews() {
        
        // section one
        let sectionOne = SPStoreSectionOne()
        sectionOne.index = 0
        
        let sectionOneRowOne = SPStoreBannerComponent()
        sectionOneRowOne.index = 0
        
        sectionOne.addComponent(sectionOneRowOne)
        sections.append(sectionOne)
        
        // section tow
        let sectionTwo = SPStoreSectionTwo()
        sectionTwo.delegate = self
        sectionTwo.index = 1

        let sectionTwoRowOne = SPStoreTitleIndicatorComponent("运动新品")
        sectionTwoRowOne.index = 0

        let sectionTowRowTwo = SPStoreRecommendComponent()
        sectionTowRowTwo.delegate = self
        sectionTowRowTwo.index = 1

        sectionTwo.addComponents([sectionTwoRowOne, sectionTowRowTwo])
        sections.append(sectionTwo)
        
        // section three
        let sectionThree = SPStoreSectionThree()
        sectionThree.index = 2
        
        let sectionThreeRowOne = SPStoreTitleIndicatorComponent("运动热卖")
        sectionThreeRowOne.index = 0
        
        let sectionThereeRowTwo = SPStoreShowImageComponent()
        sectionThereeRowTwo.index = 1
        
        let sectionThreeRowMargin = ComponentsMarginComponse.init(height: 10, bg: .color_353331)
        sectionThreeRowMargin.index = 2
        
        let sectionThereeRowThree = SPStoreShowImageComponent()
        sectionThereeRowThree.index = 3
        
        sectionThree.addComponents([sectionThreeRowOne, sectionThereeRowTwo, sectionThreeRowMargin, sectionThereeRowThree])
        sections.append(sectionThree)
        
        // section four
        let sectionFour = SPStoreSectionFour()
        sectionFour.index = 3
        
        let sectionFourRowOne = SPStoreTitleIndicatorComponent("运动设备")
        sectionFourRowOne.index = 0
        
        let sectionFourRowTwo = SPStoreRecommendComponent()
        sectionFourRowTwo.index = 1
        
        sectionFour.addComponents([sectionFourRowOne, sectionFourRowTwo])
        sections.append(sectionFour)
        
        // section five
        let sectionFive = SPStoreSectionThree()
        sectionFive.index = 4
        
        let sectionFiveRowOne = SPStoreTitleIndicatorComponent("运动热卖")
        sectionFiveRowOne.index = 0
        
        let sectionFiveRowTwo = SPStoreShowImageComponent()
        sectionFiveRowTwo.index = 1
        
        let sectionFiveRowMargin = ComponentsMarginComponse.init(height: 10, bg: .color_353331)
        sectionFiveRowMargin.index = 2
        
        let sectionFiveRowThree = SPStoreShowImageComponent()
        sectionFiveRowThree.index = 3
        
        sectionFive.addComponents([sectionFiveRowOne, sectionFiveRowTwo, sectionFiveRowMargin, sectionFiveRowThree])
        sections.append(sectionFive)
    }
}

