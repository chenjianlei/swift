//
//  Event.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/14.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import Foundation

struct EventObj {
    var params: Any?
    var name: String!
}

protocol EventDelegate {
    func onEvent(_ obj: EventObj)
}

extension Notification.Name {
    
    /// mine
    public static let customEventNameForMine: NSNotification.Name = NSNotification.Name.init(rawValue: "customEventNameForMine")
    
    /// store
    public static let customEventNameForStore: NSNotification.Name = NSNotification.Name.init(rawValue: "customEventNameForStore")
    
    /// friend
    public static let customEventNameForFriend: NSNotification.Name = NSNotification.Name.init(rawValue: "customEventNameForFriend")
    
    /// home
    public static let customEventNameForHome: NSNotification.Name = NSNotification.Name.init(rawValue: "customEventNameForHome")
}


extension Notification.Name {
    
    public static let storeEventNameForEvent: NSNotification.Name = NSNotification.Name.init(rawValue: "storeEventNameForEvent")
}
