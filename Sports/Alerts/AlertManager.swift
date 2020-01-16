//
//  AlertManager.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

typealias Handle = () -> Void
let afterTime: TimeInterval = 1

extension UIView {
    
    fileprivate func showTxt(_ str: String?, after: TimeInterval, handle: @escaping Handle) -> Void {
        DispatchQueue.main.async(execute: {
            let alert = MBProgressHUD.showAdded(to: ((UIApplication.shared.delegate?.window)!)!, animated: true)
            alert.label.text = str ?? ""
            alert.backgroundView.blurEffectStyle = .light
            alert.removeFromSuperViewOnHide = true
            alert.completionBlock = handle
            alert.backgroundView.color = .clear
            alert.mode = .text
            alert.hide(animated: true, afterDelay: after)
        })
    }
    
    func success(_ str: String) -> Void {
        success(str) {
            
        }
    }
    
    func success(_ str: String, handle: @escaping Handle) -> Void {
        showTxt(str, after: afterTime, handle: handle)
    }
    
    func failed(_ str: String) -> Void {
        failed(str) {
            
        }
    }
    
    func failed(_ str: String, handle: @escaping Handle) -> Void {
        showTxt(str, after: afterTime, handle: handle)
    }
}

extension UIViewController {
    
    private func showTxt(_ str: String?, after: TimeInterval, handle: @escaping Handle) -> Void {
        view.showTxt(str, after: after, handle: handle)
    }
    
    func success(_ str: String) -> Void {
        success(str) {
            
        }
    }
    
    func success(_ str: String, handle: @escaping Handle) -> Void {
        showTxt(str, after: afterTime, handle: handle)
    }
    
    func failed(_ str: String) -> Void {
        failed(str) {
            
        }
    }
    
    func failed(_ str: String, handle: @escaping Handle) -> Void {
        showTxt(str, after: afterTime, handle: handle)
    }
}
