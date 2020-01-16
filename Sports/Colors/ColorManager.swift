//
//  ColorManager.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import Foundation
import ObjectMapper

class ColorManager {
    
    static let share = ColorManager()
    
    let cache = NSCache<AnyObject, AnyObject>()
    let transform = HexColorTransform()
    
    func make(_ hex: String!) -> UIColor {
        guard let color = cache.object(forKey: hex as AnyObject) as? UIColor else {
            if let c = transform.transformFromJSON(hex) {
                cache.setObject(c as AnyObject, forKey: hex as AnyObject)
                return c
            } else {
                return UIColor.black
            }
        }
        return color
    }
}

extension UIColor {
    static var color_E6E6E6: UIColor {
        return ColorManager.share.make("E6E6E6")
    }
    
    static var color_E4E4E4: UIColor {
        return ColorManager.share.make("E4E4E4")
    }
    
    static var color_F6F6F6: UIColor {
        return ColorManager.share.make("F6F6F6")
    }
    
    static var color_353331: UIColor {
        return ColorManager.share.make("353331")
    }
    
    static var color_E7E7E7: UIColor {
          return ColorManager.share.make("E7E7E7")
    }
    
    static var color_E8E8E8: UIColor {
          return ColorManager.share.make("E8E8E8")
    }
    
    static var color_FFFFFF: UIColor {
          return ColorManager.share.make("FFFFFF")
    }
    
    static var color_666666: UIColor {
          return ColorManager.share.make("666666")
    }
    
    static var color_00D58E: UIColor {
          return ColorManager.share.make("00D58E")
    }
    
    static var color_35373B: UIColor {
          return ColorManager.share.make("35373B")
    }
    
    static var color_E7EEFC: UIColor {
          return ColorManager.share.make("E7EEFC")
    }
    
    static var color_5A5D65: UIColor {
          return ColorManager.share.make("5A5D65")
    }
}
