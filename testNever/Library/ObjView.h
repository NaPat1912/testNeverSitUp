//
//  ObjView.h
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "Global.h"

#import "Helper.h"

#import "AlertNew.h"


typedef enum {
    alertType_ReEnroll,
    alertType_Forgot,
    alertType_Internet,
    alertType_Logout,
    alertType_Activate
} alertType;


@protocol ObjViewDelegate <NSObject>
@optional
- (void)objView:(NSObject *)obj response:(NSDictionary *)response;
@end

#pragma mark -


@interface ObjView : UIViewController<
UITextFieldDelegate,
UICollectionViewDelegate,
UICollectionViewDataSource,
ObjViewDelegate,
//AlertDelegate
AlertNewDelegate
>

@property (nonatomic, weak) id<ObjViewDelegate> delegate;

@property Global *global;

@property Helper *helper;

@property Lang *lang;

- (void)startLoading;
- (void)stopLoading;

- (void)authLogout;

- (void)registerForKeyboardNotifications:(UIScrollView *)scrollView;

- (void)enableScreenRotation:(BOOL)enable;

- (void)setViewTitle:(NSString *)title;

//- (void)showDashbardBarButtonItem;

- (void)hideHomeButton;
- (void)hideBackButton;
- (void)showBackButton;
- (void)showCloseButton;
- (void)showCrossButton;
- (IBAction)btnCrossClick:(id)sender;

- (void)setNavigationBarTransparent;

- (BOOL)passCheckLoginType:(NSString *)segue;


- (void)showAlert:(NSString *)message;
- (void)showAlert:(NSString *)message success:(BOOL)success;
- (void)showAlert:(NSString *)message success:(BOOL)success closeBtnHandler:(void(^)(BOOL))closeBtnHandler;
- (void)showAlert:(NSString *)message closeBtnTitle:(NSString *)closeBtnTitle;
- (void)showAlert:(NSString *)message okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;
- (void)showAlert:(NSString *)message success:(BOOL)success okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;
- (void)showAlert:(NSString *)message closeBtnTitle:(NSString *)closeBtnTitle okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;
- (void)showAlert:(NSString *)message okBtnTitle:(NSString *)okBtnTitle okBtnColor:(UIColor *)okBtnColor okBtnHandler:(void(^)(BOOL))okBtnHandler closeBtnTitle:(NSString *)closeBtnTitle closeBtnColor:(UIColor *)closeBtnColor;
- (void)showAlert:(NSString *)message success:(BOOL)success closeBtnTitle:(NSString *)closeBtnTitle okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;
- (void)showAlert:(NSString *)message closeBtnTitle:(NSString *)closeBtnTitle closeBtnHandler:(void(^)(BOOL))closeBtnHandler okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;
- (void)showAlert:(NSString *)title message:(NSString *)message closeBtnTitle:(NSString *)closeBtnTitle closeBtnHandler:(void(^)(BOOL))closeBtnHandler okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;

- (void)showAlert:(NSString *)title message:(NSString *)message;
- (void)showAlert:(NSString *)title message:(NSString *)message success:(BOOL)success;
- (void)showAlert:(NSString *)title message:(NSString *)message success:(BOOL)success closeBtnHandler:(void(^)(BOOL))closeBtnHandler;
- (void)showAlert:(NSString *)title message:(NSString *)message closeBtnTitle:(NSString *)closeBtnTitle;
- (void)showAlert:(NSString *)title message:(NSString *)message okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;
- (void)showAlert:(NSString *)title message:(NSString *)message success:(BOOL)success okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;
- (void)showAlert:(NSString *)title message:(NSString *)message closeBtnTitle:(NSString *)closeBtnTitle okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;
- (void)showAlert:(NSString *)title message:(NSString *)message okBtnTitle:(NSString *)okBtnTitle okBtnColor:(UIColor *)okBtnColor okBtnHandler:(void(^)(BOOL))okBtnHandler closeBtnTitle:(NSString *)closeBtnTitle closeBtnColor:(UIColor *)closeBtnColor;
- (void)showAlert:(NSString *)title message:(NSString *)message success:(BOOL)success closeBtnTitle:(NSString *)closeBtnTitle okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;

/*
- (void)showAlert:(NSString *)title message:(NSString *)message icon:(UIImage *)icon iconSize:(CGSize)iconSize;
- (void)showAlert:(NSString *)title message:(NSString *)message icon:(UIImage *)icon iconSize:(CGSize)iconSize closeBtnHandler:(void(^)(BOOL))closeBtnHandler;
- (void)showAlert:(NSString *)title message:(NSString *)message icon:(UIImage *)icon iconSize:(CGSize)iconSize closeBtnTitle:(NSString *)closeBtnTitle;
- (void)showAlert:(NSString *)title message:(NSString *)message icon:(UIImage *)icon iconSize:(CGSize)iconSize okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;
- (void)showAlert:(NSString *)title message:(NSString *)message icon:(UIImage *)icon iconSize:(CGSize)iconSize closeBtnTitle:(NSString *)closeBtnTitle okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;
- (void)showAlert:(NSString *)title message:(NSString *)message icon:(UIImage *)icon iconSize:(CGSize)iconSize okBtnTitle:(NSString *)okBtnTitle okBtnColor:(UIColor *)okBtnColor okBtnHandler:(void(^)(BOOL))okBtnHandler closeBtnTitle:(NSString *)closeBtnTitle closeBtnColor:(UIColor *)closeBtnColor;
 */
- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML icon:(UIImage *)icon iconSize:(CGSize)iconSize;
- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML icon:(UIImage *)icon iconSize:(CGSize)iconSize closeBtnHandler:(void(^)(BOOL))closeBtnHandler;
- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML icon:(UIImage *)icon iconSize:(CGSize)iconSize closeBtnTitle:(NSString *)closeBtnTitle;
- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML icon:(UIImage *)icon iconSize:(CGSize)iconSize okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;
- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML icon:(UIImage *)icon iconSize:(CGSize)iconSize closeBtnTitle:(NSString *)closeBtnTitle okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;
- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML icon:(UIImage *)icon iconSize:(CGSize)iconSize okBtnTitle:(NSString *)okBtnTitle okBtnColor:(UIColor *)okBtnColor okBtnHandler:(void(^)(BOOL))okBtnHandler closeBtnTitle:(NSString *)closeBtnTitle closeBtnColor:(UIColor *)closeBtnColor;
- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML success:(BOOL)success okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler;


- (void)startProcessing;
- (void)startProcessing:(NSString *)title message:(NSString *)message;
- (void)stopProcessing;

- (IBAction)btnHomeClick:(id)sender;

- (void)setDisableTouchHideKeyboard;

//- (void)checkMemberStatus;
- (void)checkMemberStatus:(BOOL)showStartPage;

- (BOOL)isLogined;


// ####################

@property UICollectionView *collectionHeroMenu;

- (void)genHeroMenu:(UICollectionView *)collectionHeroMenu activedMenu:(NSString *)activedMenu;

- (void)trickerAppResume;

- (void)reloadHeroMenu;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

// ####################

@end
