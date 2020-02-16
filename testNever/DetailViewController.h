//
//  DetailViewController.h
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property NSDictionary *detailData;

@property (weak, nonatomic) IBOutlet UILabel *labelGrade;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelSex;

@end

NS_ASSUME_NONNULL_END
