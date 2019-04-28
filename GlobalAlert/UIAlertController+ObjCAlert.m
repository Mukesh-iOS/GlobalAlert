//
//  UIAlertController+ObjCAlert.m
//  GlobalAlert
//
//  Created by Mukesh on 19/09/18.
//  Copyright © 2018 Mukesh. All rights reserved.
//

#import "UIAlertController+ObjCAlert.h"

#define kAlertOk @"OK"
#define kAlertCancel @"Cancel"

typedef void (^givenIndex)(BOOL success, NSError *error);

@implementation UIAlertController (ObjCAlert)

/* 

 Alert with Ok & Cancel button - No Actions - Default behaviour
 
*/

+(void)showAlertViewWithTitle:(NSString *)title
                     messsage:(NSString *)msg
             inViewController:(UIViewController *) view {
    
    UIAlertController *alertCont = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:kAlertOk style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {
                                                   
                                               }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:kAlertCancel style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       [alertCont dismissViewControllerAnimated:YES completion:nil];
                                                   }];
    [alertCont addAction:cancel];
    [alertCont addAction:ok];
    [view presentViewController:alertCont animated:YES completion:nil];
}

/*
 
 Alert with Ok & Cancel button 
 
 For OK - You will get a block to do you own actions
 
*/

+(void)showAlertViewWithBlock:(NSString *)title
                     messsage:(NSString *)msg
             inViewController:(UIViewController *) view
                       method:(void (^)(void))okmethod {
    
    UIAlertController *alertCont =[UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:kAlertOk style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {
                                                   okmethod();
                                               }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:kAlertCancel style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       [alertCont dismissViewControllerAnimated:YES completion:nil];
                                                   }];
    [alertCont addAction:cancel];
    [alertCont addAction:ok];
    [view presentViewController:alertCont animated:YES completion:nil];
}

/*
 
 Alert with only Ok button
 
 For OK - You will get a block to do you own actions
 
*/

+(void)showAlertWithSimpleOKBlock:(NSString *)title
                         messsage:(NSString *)msg
                 inViewController:(UIViewController *) view
                           method:(void (^)(void))okmethod {
    
    UIAlertController *alertCont =[UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:kAlertOk style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {
                                                   okmethod();
                                               }];
    [alertCont addAction:ok];
    [view presentViewController:alertCont animated:YES completion:nil];
}

/*
 
 Alert with only Ok & Cancel button
 
 For OK     - You will get a block to do you own actions
 For Cancel - You will get a block to do you own actions
 
 */

+(void)showAlertWithSimpleOKCancelBlock:(NSString *)title
                               messsage:(NSString *)msg
                       inViewController:(UIViewController *) view
                                 method:(void (^)(void))okmethod
                           cancelMethod:(void (^)(void))cancelMethod {
    
    UIAlertController *alertCont =[UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:kAlertOk style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {
                                                   okmethod();
                                               }];
    
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:kAlertCancel style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       cancelMethod();
                                                   }];
    [alertCont addAction:ok];
    [alertCont addAction:cancel];
    [view presentViewController:alertCont animated:YES completion:nil];
}

/*
 
 Alert with Ok & Cancel button
 
 You can rename - "OK"     button with your own
 You can rename - "Cancel" button with your own
 For OK         - You will get a block to do you own actions
 For Cancel     - You will get a block to do you own actions
 
 */

+(void)showAlertWithSimpleOKCancelBlockWithTitle:(NSString *)title
                                        messsage:(NSString *)msg
                                inViewController:(UIViewController *) view
                                          method:(void (^)(void))okmethod
                                    cancelMethod:(void (^)(void))cancelMethod
                                         okTitle:(NSString *)okName
                                     cancelTitle:(NSString *)cancelName {
    
    UIAlertController *alertCont =[UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:okName style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {
                                                   okmethod();
                                               }];
    
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:cancelName style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       cancelMethod();
                                                   }];
    [alertCont addAction:ok];
    [alertCont addAction:cancel];
    [view presentViewController:alertCont animated:YES completion:nil];
}

/*
 
 Alert with only Ok button
 
 Ok - will dismiss alert
 
*/

+(void)showSimpleAlert:(NSString *)title
               message:(NSString *)msg
      inViewController:(UIViewController *)view {
    
    UIAlertController *alertCont =[UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:kAlertOk style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {
                                                   
                                               }];
    [alertCont addAction:ok];
    [view presentViewController:alertCont animated:YES completion:nil];
}

/*
 
 Action Sheet
 
  * Just pass array of titles to display
  * You will have a block which will be called whenever you click the content in action sheet along with index of it.
  * Cancel - Default behaviour
 
*/

+(void)showActionSheet:(NSString *)title
               message:(NSString*)msg
      inViewController:(UIViewController*)view
           buttonNames:(NSArray*)buttonNames
           clickMethod:(void (^)(NSInteger indexOfCLick))clickMethod {
    
    UIAlertController *alertCont =[UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSString *opt in buttonNames) {
        [alertCont addAction:[UIAlertAction actionWithTitle:opt style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
            NSInteger index = [alertCont.actions indexOfObject:action];
            clickMethod(index);
        }]];
    }
    [alertCont addAction:[UIAlertAction actionWithTitle:kAlertCancel style:UIAlertActionStyleCancel handler:nil]];
    [view presentViewController:alertCont animated:YES completion:nil];
}

@end
