//
//  ViewController.m
//  GlobalAlert
//
//  Created by Mukesh on 19/09/18.
//  Copyright © 2018 Mukesh. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertController+ObjCAlert.h"

#define kAlert @"Alert"
#define kErrorDescription @"Here is your alert description"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)howToUseAlert
{
    // Click on the method definition for detail need of the particular alert
    
    // ******************** //
    
    [UIAlertController showAlertViewWithTitle:kAlert messsage:kErrorDescription inViewController:self];
    
    // ******************** //
    
    [UIAlertController showAlertViewWithBlock:kAlert messsage:kErrorDescription inViewController:self method:^{
        NSLog(@"Perform your OK action");
    }];
    
    // ******************** //
    
    [UIAlertController showSimpleAlert:kAlert message:kErrorDescription inViewController:self];
    
    // ******************** //
    
    [UIAlertController showAlertWithSimpleOKBlock:kAlert messsage:kErrorDescription inViewController:self method:^{
        NSLog(@"Perform your OK action");
    }];
    
    // ******************** //
    
    [UIAlertController showAlertWithSimpleOKCancelBlock:kAlert messsage:kErrorDescription inViewController:self method:^{
        NSLog(@"Perform your OK action");
    } cancelMethod:^{
        NSLog(@"Perform your Cancel action");
    }];
    
    // ******************** //
    
    [UIAlertController showAlertWithSimpleOKCancelBlockWithTitle:kAlert messsage:kErrorDescription inViewController:self method:^{
        NSLog(@"Perform your OK action");
    } cancelMethod:^{
        NSLog(@"Perform your Cancel action");
    } okTitle:@"Okay Tilte" cancelTitle:@"Cancel Title"];
    
    // ******************** //
    
    NSArray *titles = [[NSArray alloc]initWithObjects:@"Title1",@"Title2",@"Title3", @"Etc", @"Etc", nil];
    
    [UIAlertController showActionSheet:kAlert message:kErrorDescription inViewController:self buttonNames:titles clickMethod:^(NSInteger indexOfCLick) {
        
        switch (indexOfCLick) {
            case 1:
                NSLog(@"Title1 Action");
                break;
            case 2:
                NSLog(@"Title1 Action");
                break;
            case 3:
                NSLog(@"Title1 Action");
                break;
            case 4:
                NSLog(@"Etc Etc... goes on");
                break;
                
            default:
                break;
        }
    }];
    
    // ******************** //
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
