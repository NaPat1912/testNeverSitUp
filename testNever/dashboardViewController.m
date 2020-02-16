//
//  dashboardViewController.m
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import "dashboardViewController.h"
#import "dashboardTableViewCell.h"
#import "DetailViewController.h"

@interface dashboardViewController ()

@end

@implementation dashboardViewController
{
    NSMutableArray *fieldList;
    NSString *customerId;
    NSDictionary *data;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initVar];
}

- (void)initVar {
    self.tableCustomer.delegate = self;
    self.tableCustomer.dataSource = self;
    //NSLog(@"dash : %@",self.customerList);
    
    [self genData];
}

- (void)genData {
    fieldList = [[NSMutableArray alloc] init];
    
    NSArray *datas = (NSArray *) self.customerList;
    for (NSInteger i = 0; i < [datas count]; i++) {
        NSDictionary *data = (NSDictionary *) [datas objectAtIndex:i];
        
        [fieldList addObject:data];
    }
    
    NSLog(@"fieldList: %@",fieldList);
    
    [self.tableCustomer reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 0;
    
    count = [self.customerList count];
    NSLog(@"count: %ld",(long)count);
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    static NSString *MyIdentifier = @"customerCell";
    
    dashboardTableViewCell *this_cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    this_cell.delegate = self;
    
    if (fieldList != nil) {
        NSDictionary *data = (NSDictionary *) [fieldList objectAtIndex:indexPath.row];
        [this_cell render:data];
    }
    
    cell = (UITableViewCell *) this_cell;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    
    NSDictionary *data = (NSDictionary *) [fieldList objectAtIndex:indexPath.row];
    customerId = data[@"id"];
    
    dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC * 0.2f));
    dispatch_after(timer, dispatch_get_main_queue(), ^(void){
        [self submitForm];
    });
    
}

-(IBAction)btnLogoutClick:(id)sender
{
    [self performSegueWithIdentifier:@"segueLogout" sender:self];
}

-(void)submitForm{
    __block NSMutableDictionary *resultsDictionary;

    NSDictionary *userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:self.tokenId, @"token",customerId,@"customerId", nil];//if your json structure is something like {"title":"first title","blog_id":"1"}
    if ([NSJSONSerialization isValidJSONObject:userDictionary]) {//validate it
    NSError* error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:userDictionary options:NSJSONWritingPrettyPrinted error: &error];
    NSURL* url = [NSURL URLWithString:@"http://neversitup.pythonanywhere.com/getCustomerDetail"];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    [request setHTTPMethod:@"POST"];//use POST
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d",[jsonData length]] forHTTPHeaderField:@"Content-length"];
    [request setHTTPBody:jsonData];//set data
     __block NSError *error1 = [[NSError alloc] init];

     //use async way to connect network
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse* response,NSData* data,NSError* error)
    {
        if ([data length]>0 && error == nil) {
            resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error1];
            NSLog(@"resultsDictionary is %@",resultsDictionary);
            
            self->data = resultsDictionary[@"data"];
            
            dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC * 0.5f));
            dispatch_after(timer, dispatch_get_main_queue(), ^(void){
                [self nextPage];
            });
            

        } else if ([data length]==0 && error ==nil) {
            NSLog(@" download data is null");
        } else if( error!=nil) {
            NSLog(@" error is %@",error);
        }
    }];
        }
}

-(void)nextPage{
    [self performSegueWithIdentifier:@"segueNext" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segueNext"]) {
        DetailViewController *vc = [segue destinationViewController];
        vc.detailData = data;
    }
}

@end
