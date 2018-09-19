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

typealias clickMethod = (_ indexOfButton : NSInteger) -> Void

extension UIAlertController
{
    /*
     
     Alert with Ok & Cancel button
     
     For OK - You will get a block to do you own actions
     
     */
    
    func showDefaultAlert ( _ title : String , message : String , inViewController : UIViewController, okAction : @escaping okMethod)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action:UIAlertAction) -> Void in
            okAction()
        }))
        inViewController.present(alert, animated: true , completion: nil)
    }
    
    /*
     
     Alert with only Ok & Cancel button
     
     For OK     - You will get a block to do you own actions
     For Cancel - You will get a block to do you own actions
     
     */
    
    func showDefaultAlertWithBlocks ( _ title : String , message : String , inViewController : UIViewController, okAction : @escaping okMethod, otherAction : @escaping otherMethod){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action:UIAlertAction) -> Void in
            otherAction()
        }))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action:UIAlertAction) -> Void in
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
    
    func showActionSheet ( _ title : String , message : String , inViewController : UIViewController , buttonNames : NSArray , clickAction : @escaping clickMethod )
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for opt in buttonNames
        {
            alert.addAction(UIAlertAction(title: opt as? String, style: .default, handler: { (actionIndex : UIAlertAction) -> Void in
                let index : NSInteger = alert.actions.index(of: actionIndex)! as NSInteger
                clickAction(index)
            }))
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        inViewController.present(alert, animated: true , completion: nil)
    }
    
    /*
     
     Alert with only Ok button
     
     For OK - You will get a block to do you own actions
     
     */
    
    func showSimpleAlertWithOKBlock ( _ title : String , message : String , inViewController : UIViewController, okAction : @escaping okMethod){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action:UIAlertAction) -> Void in
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
    
    func showCustomAlertsWithBlocks ( _ title : String , message : String, buttonOneTitle : String, buttonTwoTitle : String , inViewController : UIViewController, okAction : @escaping okMethod, otherAction : @escaping otherMethod)
    {
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

