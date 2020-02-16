//
//  AlertNew.h
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol AlertNewDelegate <NSObject>
@optional
- (void)alert:(UIViewController *)obj close:(BOOL)close;
@end

#pragma mark -


@interface AlertNew : UIViewController

@property (nonatomic, weak) id<AlertNewDelegate> delegate;


@property (strong, nonatomic) IBOutlet UIView *viewBG;

@property (strong, nonatomic) IBOutlet UIView *viewAlert;

@property (strong, nonatomic) IBOutlet UIImageView *imgStatus;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgStatusWidth;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imgStatusHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imgStatusTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgStatusBottom;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelMsg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelMsgTop;


@property (weak, nonatomic) IBOutlet UIView *viewButton;

@property (strong, nonatomic) IBOutlet UIButton *btnTwo;
//@property (strong, nonatomic) IBOutlet NSLayoutConstraint *btnTwoHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnTwoWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnTwoLeading;
- (IBAction)btnTwoClick:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnOne;
//@property (strong, nonatomic) IBOutlet NSLayoutConstraint *btnOneHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnOneWidth;
- (IBAction)btnOneClick:(id)sender;


- (void)reset;

- (void)setMessageTitle:(NSString *)message;
- (void)setMessage:(NSString *)message;
- (void)setMessageHTML:(NSString *)message;

- (void)setBtnOneTitle:(NSString *)title;

- (void)setBtnTwoTitle:(NSString *)title;

- (void)setBtnOneColor:(UIColor *)color;
- (void)setBtnTwoColor:(UIColor *)color;

- (void)showBackground;

- (void)showStatus:(BOOL)success;

- (void)showIcon:(UIImage *)img width:(CGFloat)width height:(CGFloat)height;
- (void)showGifIcon:(NSString *)imgName width:(CGFloat)width height:(CGFloat)height;

- (void)setBtnOneHandler:(void(^)(BOOL))handler;
- (void)setBtnTwoHandler:(void(^)(BOOL))handler;
