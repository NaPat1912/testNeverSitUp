//
//  dashboardTableViewCell.h
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol dashboardTableViewCellDelegate;

@interface dashboardTableViewCell : UITableViewCell


@property (nonatomic, weak) id<dashboardTableViewCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

- (void)render:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
#pragma mark -

@protocol dashboardTableViewCellDelegate <NSObject>

@optional
- (void)dashboard:(dashboardTableViewCell *_Nullable)cell select:(NSString*_Nonnull)id;
@end
