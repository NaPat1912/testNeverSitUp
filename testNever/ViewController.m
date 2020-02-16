//
//  ViewController.m
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import "ViewController.h"

#import <SGHTTPRequest.h>

#import "dashboardViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSDictionary *customerList;
    NSString *token;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.inputUser.delegate = self;
    self.inputPass.delegate = self;
}

-(IBAction)btnLoginClick:(id)sender
{
    NSLog(@"User: %@",self.inputUser.text);
    NSLog(@"User: %@",self.inputPass.text);
    
    [self submit];
    
}

-(void)submit
{
    NSLog(@"submit");
    
    /*NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://neversitup.pythonanywhere.com/login"]];

    NSString *userUpdate =[NSString stringWithFormat:@"username=%@&password=%@",self.inputUser.text,self.inputPass.text];

    //create the Method "GET" or "POST"
    [urlRequest setHTTPMethod:@"POST"];

    //Convert the String to Data
    NSData *data1 = [userUpdate dataUsingEncoding:NSUTF8StringEncoding];

    //Apply the data to the body
    [urlRequest setHTTPBody:data1];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200)
        {
            NSError *parseError = nil;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            NSLog(@"The response is - %@",responseDictionary);
            NSInteger success = [[responseDictionary objectForKey:@"success"] integerValue];
            if(success == 1)
            {
                NSLog(@"Login SUCCESS");
            }
            else
            {
                NSLog(@"Login FAILURE");
            }
        }
        else
        {
            NSLog(@"Error");
        }
    }];
    [dataTask resume];*/
    
    __block NSMutableDictionary *resultsDictionary;

    NSDictionary *userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:self.inputUser.text, @"username",self.inputPass.text,@"password", nil];//if your json structure is something like {"title":"first title","blog_id":"1"}
    if ([NSJSONSerialization isValidJSONObject:userDictionary]) {//validate it
    NSError* error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:userDictionary options:NSJSONWritingPrettyPrinted error: &error];
    NSURL* url = [NSURL URLWithString:@"http://neversitup.pythonanywhere.com/login"];
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
            
            self->customerList = resultsDictionary[@"customers"];
            self->token = resultsDictionary[@"token"];
            
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
    dashboardViewController *vc = [segue destinationViewController];
    vc.customerList = customerList;
    vc.tokenId = token;
}


@end
