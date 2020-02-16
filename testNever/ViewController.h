//
//  ViewController.h
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *inputUser;
@property (weak, nonatomic) IBOutlet UITextField *inputPass;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

-(IBAction)btnLoginClick:(id)sender;

@end

