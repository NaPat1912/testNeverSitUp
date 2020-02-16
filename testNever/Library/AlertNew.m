//
//  AlertNew.m
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import "AlertNew.h"

#import "Global.h"

#import "Helper.h"


@interface AlertNew ()

@end

@implementation AlertNew
{
    BOOL inited;
    
    Global *global;
    
    Helper *helper;
    
    void (^_btnOneHandler)(BOOL clicked);
    void (^_btnTwoHandler)(BOOL clicked);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initVar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //[self.navigationController.navigationBar setHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //[self.navigationController.navigationBar setHidden:NO];
    
    if (!inited) {
        inited = YES;
        
        [self initUI];
    }
}


- (void)initVar
{
    global = [[Global alloc] init];
    
    helper = [[Helper alloc] init];
}

- (void)initUI
{
    //[self.btnOne.layer setBorderWidth:1.0f];
    //[self.btnOne.layer setCornerRadius:(self.btnOne.frame.size.height / 2.0f)];
    //[self.btnOne setClipsToBounds:YES];
    
    //[self.btnTwo.layer setBorderWidth:1.0f];
    //[self.btnTwo.layer setCornerRadius:(self.btnTwo.frame.size.height / 2.0f)];
    //[self.btnTwo setClipsToBounds:YES];
    
    [self.viewAlert.layer setCornerRadius:10.0f];
    
    UIBezierPath *maskCitizen = [UIBezierPath bezierPathWithRoundedRect:self.viewButton.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(8.0f, 8.0f)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.viewButton.bounds;
    maskLayer.path  = maskCitizen.CGPath;
    self.viewButton.layer.mask = maskLayer;
    
    //[self reset];
}

- (void)reset
{
    [self.viewBG setHidden:YES];
    
    [self.imgStatus setHidden:YES];
    [self.imgStatusHeight setConstant:0.0f];
    [self.imgStatusTop setConstant:10.0f];
    [self.imgStatusBottom setConstant:16.0f];
    
    [self.labelMsg setText:@""];
    
    [self.btnOne setHidden:YES];
    [self.btnOneWidth setConstant:0.0f];
    //[self.btnOne setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[self.btnOne setBackgroundImage:[UIImage imageNamed:@"button_cancel"] forState:UIControlStateNormal];
    [self setBtnColorNormal:self.btnOne];
    
    [self.btnTwo setHidden:YES];
    [self.btnTwoWidth setConstant:0.0f];
    [self.btnTwoLeading setConstant:0.0f];
    //[self.btnTwo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[self.btnTwo setBackgroundImage:[UIImage imageNamed:@"button_cancel"] forState:UIControlStateNormal];
    [self setBtnColorNormal:self.btnTwo];
    
    [self.labelMsgTop setConstant:0.0f];
    
    _btnOneHandler = nil;
    _btnTwoHandler = nil;
}

- (void)showBackground
{
    [self.viewBG setHidden:NO];
}

- (void)showStatus:(BOOL)success
{
    if (success) {
        [self.imgStatus setImage:[UIImage imageNamed:@"success_green"]];
    } else {
        [self.imgStatus setImage:[UIImage imageNamed:@"fail_icon"]];
    }
    
    [self.imgStatusWidth setConstant:50.0f];
    [self.imgStatusHeight setConstant:50.0f];
    [self.imgStatusTop setConstant:15.0f];
    [self.imgStatus setHidden:NO];
}

- (void)showIcon:(UIImage *)img width:(CGFloat)width height:(CGFloat)height
{
    [self.imgStatus setImage:img];
    
    [self.imgStatusWidth setConstant:width];
    [self.imgStatusHeight setConstant:height];
    [self.imgStatusTop setConstant:15.0f];
    [self.imgStatus setHidden:NO];
}

- (void)showGifIcon:(NSString *)imgName width:(CGFloat)width height:(CGFloat)height
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:imgName withExtension:@"gif"];
    
    [self.imgStatusWidth setConstant:width];
    [self.imgStatusHeight setConstant:height];
    //[self.imgStatusTop setConstant:15.0f];
    [self.imgStatusTop setConstant:10.0f];
    [self.imgStatusBottom setConstant:8.0f];
    [self.imgStatus setHidden:NO];
}

- (void)setMessageTitle:(NSString *)message
{
    [self.labelTitle setText:message];
    
    if (![self.labelMsg.text isEqualToString:@""]) {
        [self.labelMsgTop setConstant:5.0f];
    }
}

- (void)setMessage:(NSString *)message
{
    [self.labelMsg setText:message];
    
    if (![self.labelTitle.text isEqualToString:@""]) {
        [self.labelMsgTop setConstant:5.0f];
    }
}

- (void)setMessageHTML:(NSString *)message
{
    /*
    message = [message stringByAppendingString:[NSString stringWithFormat:@"<style>body { font-family: '%@'; font-size:%fpx; line-height:%fpx }</style>", self.labelMsg.font.fontName, self.labelMsg.font.pointSize, self.labelMsg.font.pointSize + 6.0f]];
    
    [self.labelMsg setAttributedText:[[NSAttributedString alloc] initWithData:[message dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)} documentAttributes:nil error:nil]];
    */
    
    [helper setUILabelTextHTML:self.labelMsg string:message];
    
    if (![self.labelTitle.text isEqualToString:@""]) {
        [self.labelMsgTop setConstant:5.0f];
    }
}

- (void)setBtnOneTitle:(NSString *)title
{
    if (![title isEqualToString:@""]) {
//        [self.btnOne setTitle:title forState:UIControlStateNormal];
//
//        //[self.btnOne setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        //[self.btnOne setBackgroundImage:[UIImage imageNamed:@"button_red_short"] forState:UIControlStateNormal];
//        [self setBtnColorHilight:self.btnOne];
//
//        /*
//        //[self.btnOneWidth setConstant:110.0f];
//        double width = [helper calculateUILabelSize:self.btnOne.titleLabel padding:0.0f].size.width;
//        width += 10.0f;
//        if (width < 110.0f) {
//            width = 110.0f;
//        }
//        [self.btnOneWidth setConstant:width];
//        */
//        [self.btnOneWidth setConstant:self.viewAlert.frame.size.width /*- 40.0f*/];
//
//        [self.btnOne setHidden:NO];
        
        
        [self.btnOne setTitle:title forState:UIControlStateNormal];
        [self setBtnColorHilight:self.btnOne];
        
        [self.btnOneWidth setConstant:self.viewAlert.frame.size.width];
        [self.btnOne setHidden:NO];
        
    }
}
- (void)setBtnTwoTitle:(NSString *)title
{
    if (![title isEqualToString:@""]) {
//        //[self.btnOne setBackgroundImage:[UIImage imageNamed:@"button_cancel"] forState:UIControlStateNormal];
//        [self setBtnColorNormal:self.btnOne];
//
//        double width = [helper calculateUILabelSize:self.btnOne.titleLabel padding:0.0f].size.width;
//        width += 10.0f;
//        if (width < 110.0f) {
//            //width = 150.0f;
//            width = self.viewButton.frame.size.width / 2.0f;
//        }
//        [self.btnOneWidth setConstant:width];
//
//        // ############################################################
//
//        [self.btnTwo setTitle:title forState:UIControlStateNormal];
//
//        //[self.btnTwo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        //[self.btnTwo setBackgroundImage:[UIImage imageNamed:@"button_red_short"] forState:UIControlStateNormal];
//        [self setBtnColorHilight:self.btnTwo];
//
//        //[self.btnTwoWidth setConstant:110.0f];
//        width = [helper calculateUILabelSize:self.btnTwo.titleLabel padding:0.0f].size.width;
//        width += 10.0f;
//        if (width < 110.0f) {
//            width = self.viewButton.frame.size.width / 2.0f;
//        }
//        [self.btnTwoWidth setConstant:width];
//
//        if (width > 110.0f) {
//            [self.btnTwoLeading setConstant:0.0f];
//        } else {
//            [self.btnTwoLeading setConstant:0.0f];
//        }
//        [self.btnTwo setHidden:NO];
        
        
        [self setBtnColorNormal:self.btnOne];
        
        [self.btnOneWidth setConstant:self.viewButton.frame.size.width / 2.0f];
        
        // ############################################################
        
        [self.btnTwo setTitle:title forState:UIControlStateNormal];
        [self setBtnColorHilight:self.btnTwo];
        
        [self.btnTwoWidth setConstant:self.viewButton.frame.size.width / 2.0f];
        [self.btnTwo setHidden:NO];
        
    }
}

- (void)setBtnOneColor:(UIColor *)color
{
    //[self.btnOne setTitleColor:color forState:UIControlStateNormal];
}
- (void)setBtnTwoColor:(UIColor *)color
{
    //[self.btnTwo setTitleColor:color forState:UIControlStateNormal];
}

- (void)setBtnColorNormal:(UIButton *)button
{
    [button setTitleColor:[helper colorFromHexString:@"AAAAAA"] forState:UIControlStateNormal];
    [button setBackgroundColor:[helper colorFromHexString:@"EFEFEF"]];
    [button.layer setBorderColor:[helper colorFromHexString:@"EFEFEF"].CGColor];
    
    /*
    [button setTitleColor:[helper colorFromHexString:@"999999"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"button_cancel"] forState:UIControlStateNormal];
    */
}
- (void)setBtnColorHilight:(UIButton *)button
{
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[helper colorFromHexString:@"ce0037"]];
    [button.layer setBorderColor:[helper colorFromHexString:@"ce0037"].CGColor];
    
    /*
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"button_red_short"] forState:UIControlStateNormal];
    */
}

- (void)setBtnOneHandler:(void(^)(BOOL))handler
{
    _btnOneHandler = [handler copy];
}
- (void)setBtnTwoHandler:(void(^)(BOOL))handler
{
    _btnTwoHandler = [handler copy];
}

- (IBAction)btnOneClick:(id)sender
{
    [self close];
    
    if (_btnOneHandler != nil) {
        _btnOneHandler(YES);
    }
}

- (IBAction)btnTwoClick:(id)sender
{
    [self close];
    
    if (_btnTwoHandler != nil) {
        _btnTwoHandler(YES);
    }
}

- (void)close
{
    if ([self.delegate respondsToSelector:@selector(alert:close:)]) {
        [self.delegate alert:self close:YES];
    }
}

@end

