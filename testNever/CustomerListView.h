//
//  CustomerListView.h
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomerListView : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property NSDictionary *customerList;

@property (weak, nonatomic) IBOutlet UITableView *tableCustomer;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIButton *btnLogout;

-(IBAction)btnLogoutClick:(id)sender;

@end

NS_ASSUME_NONNULL_END
