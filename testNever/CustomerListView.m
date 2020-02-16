//
//  CustomerListView.m
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import "CustomerListView.h"

@interface CustomerListView ()

@end

@implementation CustomerListView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableCustomer.delegate =self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 2;
    
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(IBAction)btnLogoutClick:(id)sender
{
    
}

@end
