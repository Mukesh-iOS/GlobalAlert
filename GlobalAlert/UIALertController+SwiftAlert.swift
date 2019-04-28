//
//  UIALertController+SwiftAlert.swift
//  GlobalAlert
//
//  Created by Mukesh on 19/09/18.
//  Copyright © 2018 Mukesh. All rights reserved.
//

import UIKit

typealias okMethod = () -> Void
typealias otherMethod = () -> Void
typealias clickMethod = (_ indexOfButton: NSInteger) -> Void

private enum AlertStringConstants: String {
    
    case ok = "OK"
    case cancel = "Cancel"
    
    var description: String {
        return self.rawValue
    }
}

extension UIAlertController {
    /*
     
     Alert with Ok & Cancel button
     
     For OK - You will get a block to do you own actions
     
     */
    
    class func showDefaultAlert (_ title: String , message: String , inViewController: UIViewController, okAction: @escaping okMethod) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: AlertStringConstants.cancel.description, style: .cancel, handler: nil ))
        
        
        alert.addAction(UIAlertAction(title: AlertStringConstants.ok.description, style: .default, handler: { (action:UIAlertAction) -> Void in
            okAction()
        }))
        inViewController.present(alert, animated: true , completion: nil)
    }
    
    /*
     
     Alert with only Ok & Cancel button
     
     For OK     - You will get a block to do you own actions
     For Cancel - You will get a block to do you own actions
     
     */
    
    class func showDefaultAlertWithBlocks (_ title: String , message: String , inViewController: UIViewController, okAction: @escaping okMethod, otherAction: @escaping otherMethod) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: AlertStringConstants.cancel.description, style: .default, handler: { (action:UIAlertAction) -> Void in
            otherAction()
        }))
        
        alert.addAction(UIAlertAction(title: AlertStringConstants.ok.description, style: .default, handler: { (action:UIAlertAction) -> Void in
            okAction()
        }))
        
        inViewController.present(alert, animated: true , completion: nil)
    }
    
    /*
     
     Action Sheet
     
     * Just pass array of titles to display
     * You will have a block which will be called whenever you click the content in action sheet along with index of it.
     * Cancel - Default behaviour
     
     */
    
    class func showActionSheet (_ title: String , message: String , inViewController: UIViewController , buttonNames: NSArray , clickAction: @escaping clickMethod) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for opt in buttonNames {
            alert.addAction(UIAlertAction(title: opt as? String, style: .default, handler: { (actionIndex : UIAlertAction) -> Void in
                let index : NSInteger = alert.actions.index(of: actionIndex)! as NSInteger
                clickAction(index)
            }))
        }
        alert.addAction(UIAlertAction(title: AlertStringConstants.cancel.description, style: .cancel, handler: nil ))
        inViewController.present(alert, animated: true , completion: nil)
    }
    
    /*
     
     Alert with only Ok button
     
     For OK - You will get a block to do you own actions
     
     */
    
    class func showSimpleAlertWithOKBlock (_ title: String , message: String , inViewController: UIViewController, okAction: @escaping okMethod) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: AlertStringConstants.ok.description, style: .default, handler: { (action:UIAlertAction) -> Void in
            okAction()
        }))
        
        inViewController.present(alert, animated: true , completion: nil)
    }
    
    /*
     
     Alert with Ok & Cancel button
     
     You can rename - "OK"     button with your own
     You can rename - "Cancel" button with your own
     For OK         - You will get a block to do you own actions
     For Cancel     - You will get a block to do you own actions
     
     */
    
    class func showCustomAlertsWithBlocks (_ title: String , message: String, buttonOneTitle: String, buttonTwoTitle: String , inViewController: UIViewController, okAction: @escaping okMethod, otherAction: @escaping otherMethod) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: buttonOneTitle, style: .default, handler: { (action:UIAlertAction) -> Void in
            okAction()
        }))
        
        alert.addAction(UIAlertAction(title: buttonTwoTitle, style: .default, handler: { (action:UIAlertAction) -> Void in
            otherAction()
        }))
        
        inViewController.present(alert, animated: true , completion: nil)
    }
}

