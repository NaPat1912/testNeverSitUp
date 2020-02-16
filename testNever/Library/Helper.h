//
//  Helper.h
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

//#import <CoreLocation/CoreLocation.h>


typedef enum {
    none,
    touch,
    face
} bioType;


@interface Helper : NSObject<
    UITextFieldDelegate,
    UITextViewDelegate
    //CLLocationManagerDelegate
>

//- (void)requestCurrentLocationAccessPermission;

- (void)updateAuthTime;
- (void)clearAuthTime;

- (void)saveUserDefaults:(NSString *)key data:(id)data;
- (id)loadUserDefaults:(NSString *)key;
- (void)removeUserDefaults:(NSString *)key;
- (void)clearUserDefaults;

/*
- (void)updateLockedTime;
- (void)clearLockedTime;
*/

//- (void)apiRequest:(NSString *)url method:(NSString *)method params:(NSMutableDictionary *)params paramsFiles:(NSDictionary *)paramsFiles success:(void(^)(id))successCallback fail:(void(^)(id))failCallback;
//- (void)apiRequest:(NSString *)url method:(NSString *)method params:(NSMutableDictionary *)params paramsFiles:(NSDictionary *)paramsFiles hideAlert:(BOOL)hideAlert success:(void(^)(id))successCallback fail:(void(^)(id))failCallback;
//- (void)apiRequest:(NSString *)url method:(NSString *)method params:(NSMutableDictionary *)params paramsFiles:(NSDictionary *)paramsFiles hideAlert:(BOOL)hideAlert useToken:(BOOL)useToken success:(void(^)(id))successCallback fail:(void(^)(id))failCallback;
- (void)apiRequest:(UIViewController *)main url:(NSString *)url method:(NSString *)method params:(NSMutableDictionary *)params paramsFiles:(NSDictionary *)paramsFiles hideAlert:(BOOL)hideAlert useToken:(BOOL)useToken success:(void(^)(id))successCallback fail:(void(^)(id))failCallback;

- (NSObject *)jsonParserNew:(NSString *)url method:(NSString *)method params:(NSDictionary *)params;

- (UIImage *)getImageUrl:(NSString *)url cache:(BOOL)cache;

- (void)asyncImageLoad:(UIImageView *)imgView imgURL:(NSString *)imgURL;
- (void)asyncImageLoad:(UIImageView *)imgView imgURL:(NSString *)imgURL cache:(BOOL)cache;
- (void)asyncImageLoad:(UIImageView *)imgView imgURL:(NSString *)imgURL cache:(BOOL)cache scaledToSize:(CGSize)scaledToSize;

- (UIColor *)colorFromHexString:(NSString *)hexString;
- (NSString *)hexStringFromColor:(UIColor *)color;

- (CGRect)calculateUILabelSize:(UILabel *)objLabel padding:(CGFloat)padding;

//- (void)alertMessage:(NSString *)title message:(NSString *)message;
//- (void)alertMessage:(UIViewController *)vc title:(NSString *)title message:(NSString *)message;

//- (void)saveScreenshot:(UIView *)view callback:(void(^)(id))successCallback;
//- (void)saveScreenshot:(UIView *)view;
//- (void)saveScreenshot:(NSObject *)view;
- (void)saveScreenshot:(NSObject *)view successHandler:(void(^)(BOOL))successHandler;

- (BOOL)isNull:(id)data;

- (void)setAppFont:(id)view;
//- (void)setAppFont:(id)view bold:(BOOL)bold;

- (void)setUILabelTextHTML:(UILabel *)objLabel string:(NSString *)string;
- (void)setUIButtonTextHTML:(UIButton *)objButton string:(NSString *)string;

- (void)showContentView:(UIViewController *)vc title:(NSString *)title content:(NSString *)content;
- (void)showContentView:(UIViewController *)vc title:(NSString *)title url:(NSURL *)url;

- (NSInteger)genTag;
- (void)setParamsByTag:(NSInteger)tag key:(NSString *)key value:(id)value;
- (id)getParamsByTag:(NSInteger)tag key:(NSString *)key;

//- (void)inputUnderlineBorder:(UITextField *)obj borderSize:(CGFloat)borderSize;
//- (void)inputUnderlineBorder:(UITextField *)obj borderSize:(CGFloat)borderSize borderColor:(UIColor *)borderColor;
- (void)inputUnderlineBorder:(UIView *)obj borderSize:(CGFloat)borderSize borderColor:(UIColor *)borderColor;

//- (void)setupKeyboardDoneBtn:(UIView *)viewObj inputObj:(UITextField *)inputObj;
- (void)setupKeyboardDoneBtn:(UIView *)viewObj inputObj:(id)inputObj;
//- (void)setupKeyboardDoneBtnNonScrollView:(UIView *)viewObj inputObj:(UITextField *)inputObj;
- (void)setupKeyboardDoneBtnNonScrollView:(UIView *)viewObj inputObj:(id)inputObj;

- (void)formatUITextFieldPlaceHolder:(UITextField *)objTextField color:(UIColor *)color;
- (void)formatUITextFieldPlaceHolder:(UITextField *)objTextField color:(UIColor *)color reduceSize:(CGFloat)reduceSize;
- (void)formatUITextFieldPlaceHolder:(UITextField *)objTextField color:(UIColor *)color reduceSize:(CGFloat)reduceSize baselineOffset:(NSInteger)baselineOffset;
- (void)formatUITextFieldPlaceHolder:(UITextField *)objTextField color:(UIColor *)color fontSize:(CGFloat)fontSize baselineOffset:(NSInteger)baselineOffset;

- (UIImage *)imageResize:(UIImage*)image scaledToSize:(CGSize)newSize;

- (void)shakeScreen:(UIView *)view;

- (NSInteger)getCurrentTimestamp;

- (BOOL)viewIsVisible:(UIViewController *)viewController;

- (void)showCurrency:(UIView *)view amount:(double)amount color:(UIColor *)color alignRight:(BOOL)alignRight;
//- (void)showCurrency:(UIView *)view amount:(double)amount currencyUnit:(NSString *)currencyUnit color:(UIColor *)color alignRight:(BOOL)alignRight;
- (void)showCurrency:(UIView *)view amount:(double)amount currencyUnit:(NSString *)currencyUnit color:(UIColor *)color alignRight:(BOOL)alignRight widthConst:(NSLayoutConstraint *)widthConst;
- (void)showCurrency:(UIView *)view amount:(double)amount currencyUnit:(NSString *)currencyUnit color:(UIColor *)color alignRight:(BOOL)alignRight widthConst:(NSLayoutConstraint *)widthConst decimalLength:(int)decimalLength;

- (NSString *)currencyFormat:(double)number;

- (NSString *)numberFormat:(CGFloat)number;

- (void)buttonImageOnTop:(UIButton *)btn imageBottomSpace:(CGFloat)imageBottomSpace titleTopSpace:(CGFloat)titleTopSpace;

- (NSDictionary *)jsonToDic:(NSString *)jsonString;

- (NSMutableString *)filteredStringWithFilter:(NSString *)string filter:(NSString *)filter;

- (void)setUITableViewSeparatorTop:(UITableView *)tableView;

- (void)setSideBorder:(UIView *)view color:(UIColor *)color size:(CGFloat)size side:(NSString *)side;

- (void)switchFontWeight:(UILabel *)labelObj;

- (void)setFontWeight:(UILabel *)labelObj bold:(BOOL)bold;

- (CGFloat)calculateImageHeightByWidth:(UIImage *)image width:(CGFloat)width;

- (void)addConstraintLeading:(UIView *)view parentView:(UIView *)parentView constant:(CGFloat)constant multiplier:(CGFloat)multiplier;
- (void)addConstraintTrailing:(UIView *)view parentView:(UIView *)parentView constant:(CGFloat)constant multiplier:(CGFloat)multiplier;
- (void)addConstraintTop:(UIView *)view parentView:(UIView *)parentView constant:(CGFloat)constant multiplier:(CGFloat)multiplier;
- (void)addConstraintTop:(UIView *)view topView:(UIView *)parentView constant:(CGFloat)constant multiplier:(CGFloat)multiplier;
- (void)addConstraintBottom:(UIView *)view parentView:(UIView *)parentView constant:(CGFloat)constant multiplier:(CGFloat)multiplier;
- (void)addConstraintWidth:(UIView *)view parentView:(UIView *)parentView constant:(CGFloat)constant multiplier:(CGFloat)multiplier;
- (void)addConstraintHeight:(UIView *)view parentView:(UIView *)parentView constant:(CGFloat)constant multiplier:(CGFloat)multiplier;

- (NSString *)stripHTML:(NSString *)string;

- (NSMutableDictionary *)convertDicToMutableDic:(NSDictionary *)data;

- (NSString *)htmlContentSetStyle:(NSString *)content font:(UIFont *)font;

- (UIViewController *)getTopViewController;

//- (BOOL)isDeviceSupportTouchID;
- (BOOL)isDeviceSupportBio;
//- (bioType)getBioType;
- (BOOL)isTouchIDAvailable;
- (BOOL)isFaceIDAvailable;

- (BOOL)isTopView:(UIViewController *)viewController;

- (UIViewController *)topViewController;

- (BOOL)isInternetAvailable;
- (BOOL)isInternetWifi;

//- (BOOL)passCheckLoginType:(UIViewController *)main;

//- (CLLocation *)getCurrentLocation;

- (void)toggleBtnCheckbox:(UIButton *)btn;
- (BOOL)isBtnCheckboxChecked:(UIButton *)btn;

- (NSString *)getCurrentLang;

- (BOOL)isMatchRegx:(NSString *)pattern string:(NSString *)string;

- (NSString *)AESEnCrypt:(NSString *)inputData;
- (NSString *)AESDeCrypt:(NSString *)inputData;

- (void)clearPushNoti;

- (NSString *)getAppVersion;

- (void)getUpdatePushNotiCount:(UIViewController *)vc;
- (void)getUpdatePushNotiCount:(UIViewController *)vc finish:(void(^)(BOOL))finishCallback;
- (void)updatePushNotiCount:(NSDictionary *)data;
- (void)showIconBadgeNumber;

- (BOOL)isFoundNotifyToken;
- (void)updateVoiceEnroll:(UIViewController *)vc;
- (BOOL)isVoiceEnroll;

- (BOOL)checkDisplayFunction:(NSString *)function;
- (NSInteger)getTermVersion:(NSString *)code;
- (void)saveTermVersion:(NSString *)code version:(NSInteger)version;

- (void)addTextFieldPadding:(UITextField *)textField left:(CGFloat)left right:(CGFloat)right;

- (void)checkRunBatch:(UIViewController *)main responseHandler:(void(^)(BOOL))responseHandler;

- (NSString *)castVariable2String:(id)value_input;

- (void)checkServiceAvailable:(UIViewController *)vc callback:(void(^)(BOOL))successCallback;

- (UIImage *)getFileCache:(NSString *)dir url:(NSString *)url;
- (UIImage *)getFileCache:(NSString *)url;

- (void)clearFileCache:(NSString *)dir;

- (NSString *)getFileCacheSize;
- (NSString *)getFileCacheSize:(NSString *)dir;

@end
