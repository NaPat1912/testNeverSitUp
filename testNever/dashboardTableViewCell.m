//
//  dashboardTableViewCell.m
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import "dashboardTableViewCell.h"

@implementation dashboardTableViewCell
{
    NSString *cusId;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)render:(NSDictionary *)data
{
    [self.labelName setText:data[@"name"]];
    cusId = data[@"id"];
}

@end
