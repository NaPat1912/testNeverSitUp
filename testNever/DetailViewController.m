//
//  DetailViewController.m
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC * 0.5f));
    dispatch_after(timer, dispatch_get_main_queue(), ^(void){
        [self initUI];
    });
}

- (void)initUI {
    NSLog(@"detailData: %@",self.detailData);
    
    [self.labelGrade setText:self.detailData[@"customerGrade"]];
    [self.labelName setText:self.detailData[@"name"]];
    [self.labelSex setText:self.detailData[@"sex"]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
