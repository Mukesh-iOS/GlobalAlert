//
//  SampleViewController.swift
//  GlobalAlert
//
//  Created by Mukesh on 19/09/18.
//  Copyright © 2018 Mukesh. All rights reserved.
//

import UIKit

enum texts: String {
    case title = "Title"
    case message = "Here is your alert description"
    
    var description: String {
        return self.rawValue
    }
}

class TestClass: UIViewController {
    
    override func viewDidLoad() {
        
        
    }
    
    func howToCallAlert()
    {
        // Click on the method definition for detail need of the particular alert
        
        // ******************** //
        
        _ = UIAlertController().showDefaultAlert(texts.title.description, message: texts.message.description, inViewController: self) {
            
            print("Here's your ok Action")
        }
        
        // ******************** //
        
        _ = UIAlertController().showDefaultAlertWithBlocks(texts.title.description, message: texts.message.description, inViewController: self, okAction: {
            print("Here's your Ok Action")
        }, otherAction: { 
            print("Here's your Cancel Action")
        })
        
        // ******************** //
        
        _ = UIAlertController().showSimpleAlertWithOKBlock(texts.title.description, message: texts.message.description, inViewController: self, okAction: {
            print("Here's your ok Action")
        })
        
        // ******************** //
        
        _ = UIAlertController().showCustomAlertsWithBlocks(texts.title.description, message: texts.message.description, buttonOneTitle: "Custom Ok Title", buttonTwoTitle: "Custom Cancel title", inViewController: self, okAction: {
            print("Here's your Ok Action")
        }, otherAction: { 
            print("Here's your Cancel Action")
        })
        
        // ******************** //
        
        //ActionSheet
        
        let titles = ["Tilte1" , "Title2" , "Title3" , "Etc" , "Etc"]
        
        _ = UIAlertController().showActionSheet(texts.title.description, message: texts.message.description, inViewController: self, buttonNames: titles as NSArray, clickAction: { (buttonIndex) in
            
            switch buttonIndex
            {
            case 0:
                print("Title1 Action")
                break
            case 1:
                print("Title2 Action")
                break
            case 2:
                print("Title3 Action")
                break
            case 3:
                print("Etc Etc...")
                
            default:
                break
            }
        })
    }
    
}
