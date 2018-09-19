//
//  UIAlertController+ObjCAlert.h
//  GlobalAlert
//
//  Created by Mukesh on 19/09/18.
//  Copyright © 2018 Mukesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (ObjCAlert)

+(void)showAlertViewWithTitle:(NSString *)title
                                    messsage:(NSString *)msg
                            inViewController:(UIViewController *)view;

+(void)showAlertViewWithBlock:(NSString *)title
                                    messsage:(NSString *)msg
                            inViewController:(UIViewController *)view
                                      method:(void (^)(void))okmethod;

+(void)showSimpleAlert:(NSString *)title
                             message:(NSString *)msg
                    inViewController:(UIViewController *)view;

+(void)showAlertWithSimpleOKBlock:(NSString *)title
                                        messsage:(NSString *)msg
                                inViewController:(UIViewController *)view
                                          method:(void (^)(void))okmethod;

+(void)showAlertWithSimpleOKCancelBlock:(NSString *)title
                                              messsage:(NSString *)msg
                                      inViewController:(UIViewController *) view
                                                method:(void (^)(void))okmethod
                                          cancelMethod:(void (^)(void))cancelMethod;

+(void)showAlertWithSimpleOKCancelBlockWithTitle:(NSString *)title
                                                       messsage:(NSString *)msg
                                               inViewController:(UIViewController *) view
                                                         method:(void (^)(void))okmethod
                                                   cancelMethod:(void (^)(void))cancelMethod
                                                        okTitle:(NSString *)okName
                                                    cancelTitle:(NSString *)cancelName;

+(void)showActionSheet : (NSString *)title
                              message:(NSString*)msg
                     inViewController:(UIViewController*)view
                          buttonNames:(NSArray*)buttonNames
                          clickMethod:(void (^)(NSInteger indexOfCLick))clickMethod;


@end
