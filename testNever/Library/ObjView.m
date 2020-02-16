//
//  ObjView.m
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import "ObjView.h"

#import "AppDelegate.h"

#import <EventKit/EventKit.h>

#import "Global.h"

#import "Helper.h"


@interface ObjView ()

@end

@implementation ObjView
{
    //BOOL inited;
    
    UIView *viewLoading;
    
    //BOOL viewLoading_inited;
    
    
    
    UIScrollView *keyboard_mainScroll;
    
    UITextField *keyboard_activeField;
    
    //__weak Alert *alert;
    //Alert *alert;
    AlertNew *alert;
    
    
    /*
     void (^_alertBtnOneHandler)(BOOL clicked);
     void (^_alertBtnTwoHandler)(BOOL clicked);
     */
    
    BOOL enable_touchHideKeyboard;
    
    
    NSMutableArray *menuList;
    
    //Global *global;
    
    //Helper *helper;
    
    NSString *heroMenu_activedMenu;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self enableRotation:NO];
    //[self setInterfaceOrientation:UIInterfaceOrientationMaskPortrait];
    
    //[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
    
    //[[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeLeft] forKey:@"orientation"];
    
    
    [self initVar_objView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /*
    if (!inited) {
        inited = YES;
        
        //[self.view setHidden:YES];
        
        [authHelper authTimerStart];
    }
    */
    
    [self enableScreenRotation:NO];
    
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortrait) forKey:@"orientation"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //[authHelper authTimerStop];
    
    //[self addScrollViewAction:self.view];
}

- (void)trickerAppResume
{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (enable_touchHideKeyboard) {
        UITouch *touch = [touches anyObject];
        
        if (touch.phase == UITouchPhaseBegan) {
            //[aTextField resignFirstResponder];
            
            [self.view endEditing:YES];
            
            //[self resignFirstResponderAll:self.view];
        }
    }
}

- (void)setDisableTouchHideKeyboard
{
    enable_touchHideKeyboard = NO;
}

/*
 - (void)resignFirstResponderAll:(UIView *)view
 {
 NSArray *subviews = [view subviews];
 
 if (subviews!=nil && [subviews count]>0) {
 for (id objects in subviews) {
 if ([objects isKindOfClass:[UITextField class]]) {
 UITextField *theTextField = objects;
 
 //if ([objects isFirstResponder]) {
 [theTextField resignFirstResponder];
 NSLog(@"value = %@", theTextField.text);
 //}
 }
 
 [self resignFirstResponderAll:objects];
 }
 }
 }
 */


/*
 - (void)addScrollViewAction:(UIView *)view
 {
 NSArray *subviews = [view subviews];
 
 if (subviews!=nil && [subviews count]>0) {
 for (id objects in subviews) {
 if ([objects isKindOfClass:[UIScrollView class]]) {
 UIScrollView *scrollView = objects;
 
 UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTappedBackground:)];
 tapGesture.cancelsTouchesInView = NO;
 [scrollView addGestureRecognizer:tapGesture];
 }
 
 [self addScrollViewAction:objects];
 }
 }
 }
 
 - (IBAction)didTappedBackground:(id)sender
 {
 UIScrollView *scrollView = (UIScrollView *) sender;
 
 [scrollView endEditing:YES];
 }
 */

/*
 - (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
 // Return the orientation you'd prefer - this is what it launches to. The
 // user can still rotate. You don't have to implement this method, in which
 // case it launches in the current orientation
 return UIInterfaceOrientationPortrait;
 }
 */

- (void)enableScreenRotation:(BOOL)enable
{
    AppDelegate *appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    
}
/*
 - (void)setInterfaceOrientation:(UIInterfaceOrientationMask)interfaceOrientation
 {
 AppDelegate *appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
 
 appDelegate.interfaceOrentation = interfaceOrientation;
 }
 */

/*
 - (BOOL)shouldAutorotate
 {
 return NO;
 }
 */

/*
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
 {
 return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
 }
 */

/*
 - (BOOL)shouldAutorotate
 {
 return NO;
 }
 - (UIInterfaceOrientationMask)supportedInterfaceOrientations
 {
 return UIInterfaceOrientationMaskLandscapeRight;
 //return UIInterfaceOrientationMaskAll;
 }
 
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation { // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
 }
 */

- (void)initVar_objView
{
    self.global = [[Global alloc] init];
    self.helper = [[Helper alloc] init];
    
    //viewLoading_inited = NO;
    
    enable_touchHideKeyboard = YES;
    
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor blackColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
    /*
     //dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC * 0.5f));
     //dispatch_after(timer, dispatch_get_main_queue(), ^(void){
     dispatch_async(dispatch_get_main_queue(), ^(void) {
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[self.helper imageResize:[UIImage imageNamed:@"btn_home"] scaledToSize:CGSizeMake(20.0f, 20.0f)] style:UIBarButtonItemStylePlain target:self action:@selector(btnHomeClick:)];
     });
     */
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[self.helper imageResize:[UIImage imageNamed:@"btn_home"] scaledToSize:CGSizeMake(25.0f, 25.0f)] style:UIBarButtonItemStylePlain target:self action:@selector(btnHomeClick:)];
    
    
    /*
     UILabel* tlabel=[[UILabel alloc] initWithFrame:CGRectMake(0,0, 200, 40)];
     tlabel.text=self.navigationItem.title;
     tlabel.textColor=[UIColor whiteColor];
     tlabel.font = [UIFont fontWithName:@"SukhumvitTadmai-Bold" size: 20.0];
     tlabel.backgroundColor =[UIColor clearColor];
     tlabel.adjustsFontSizeToFitWidth=YES;
     self.navigationItem.titleView = tlabel;
     */
    
    
    //self.navigationItem.titleView
    
    
    //[self initLoading];
    
    
    //[NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(pushNotiTimerTick:) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(pushNotiTimerTick:) userInfo:nil repeats:YES];
    
    
    menuList = [[NSMutableArray alloc] init];
    
    
}

/*
 - (void)showDashbardBarButtonItem
 {
 self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[self.helper imageResize:[UIImage imageNamed:@"btn_home"] scaledToSize:CGSizeMake(20.0f, 20.0f)] style:UIBarButtonItemStylePlain target:self action:@selector(btnHomeClick:)];
 
 self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[self.helper imageResize:[UIImage imageNamed:@"menuhero_noti"] scaledToSize:CGSizeMake(20.0f, 20.0f)] style:UIBarButtonItemStylePlain target:self action:@selector(btnNotiClick:)];
 }
 */

- (void)setViewTitle:(NSString *)title
{
    //[self.navigationItem setTitle:title];
    
    
    UILabel *labelObj = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200, 40)];
    [labelObj setText:title];
    [labelObj setFont:[UIFont fontWithName:@"SukhumvitTadmai-Bold" size:16.0]];
    [labelObj setTextColor:[UIColor whiteColor]];
    [labelObj setBackgroundColor:[UIColor clearColor]];
    [labelObj setTextAlignment:NSTextAlignmentCenter];
    [labelObj setAdjustsFontSizeToFitWidth:YES];
    //[labelObj setMinimumScaleFactor:0.5f];
    
    self.navigationItem.titleView = labelObj;
}

- (void)initLoading
{
    //if (!viewLoading_inited) {
    //viewLoading_inited = YES;
    
    //dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC * 0.5f));
    //dispatch_after(timer, dispatch_get_main_queue(), ^(void){
    
    /*
     CGRect frame = CGRectZero;
     frame.origin.x = 0.0f;
     frame.origin.y = 40.0f;
     //frame.origin.y = 0.0f;
     frame.size.width = self.view.frame.size.width;
     frame.size.height = self.view.frame.size.height;
     
     viewLoading = [[UIView alloc] initWithFrame:frame];
     */
    
    viewLoading = [[UIView alloc] init];
    //[viewLoading setBackgroundColor:[UIColor blackColor]];
    [viewLoading setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.2f]];
    [viewLoading setHidden:YES];
    [self.view addSubview:viewLoading];
    
    
    [self.helper addConstraintTop:viewLoading parentView:self.view constant:0.0f multiplier:1.0f];
    [self.helper addConstraintBottom:viewLoading parentView:self.view constant:0.0f multiplier:1.0f];
    [self.helper addConstraintLeading:viewLoading parentView:self.view constant:0.0f multiplier:1.0f];
    [self.helper addConstraintTrailing:viewLoading parentView:self.view constant:0.0f multiplier:1.0f];
    
    // #######################################################
    
    /*
     frame.origin.x = 0.0f;
     frame.origin.y = 50.0f;
     frame.size.width = 100.0f;
     frame.size.height = frame.size.width;
     */
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    //[spinner setCenter:CGPointMake(self.view.frame.size.width/2.0f, (self.view.frame.size.height/2.0f) - spinner.frame.size.height)];
    [spinner setCenter:CGPointMake(self.view.frame.size.width/2.0f, self.view.frame.size.height/2.0f)];
    [spinner startAnimating];
    [viewLoading addSubview:spinner];
    
    //});
    //}
}

- (void)startLoading
//- (void)startLoading:(BOOL)transparent
{
    /*
     [self initLoading];
     
     if (viewLoading != nil) {
     [viewLoading setHidden:NO];
     } else {
     NSLog(@"not init viewLoading");
     }
     */
    
    /*
     if (transparent) {
     [viewLoading setBackgroundColor:[UIColor clearColor]];
     } else {
     [viewLoading setBackgroundColor:[UIColor blackColor]];
     }
     */
    
    
    //[viewLoading setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.7f]];
    
    
    
    //[self hideBackButton];
    
    
    if (viewLoading == nil) {
        
        [self initLoading];
        
        //dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC * 0.5f));
        //dispatch_after(timer, dispatch_get_main_queue(), ^(void){
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            //[self initLoading];
            
            [viewLoading setHidden:NO];
            
            //[self.view setHidden:NO];
        });
        
    } else {
        [viewLoading setHidden:NO];
    }
}
- (void)stopLoading
{
    //dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC * 1.0f));
    //dispatch_after(timer, dispatch_get_main_queue(), ^(void){
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        
        if (viewLoading != nil) {
            [viewLoading setHidden:YES];
        }
        
        //[self showBackButton];
        
    });
}

- (void)authLogout
{
    [self startLoading];
    
    dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC * 0.5f));
    dispatch_after(timer, dispatch_get_main_queue(), ^(void){
        [[[Helper alloc] init] removeUserDefaults:@"loginMode"];
        
        
        /*
        //UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Login"];
        //UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Login"];
        Login *vc = (Login *) [self.storyboard instantiateViewControllerWithIdentifier:@"Login"];
        //vc.forcedDisableFinger = YES;
        [self presentViewController:vc animated:YES completion:nil];
        
        //[self dismissViewControllerAnimated:YES completion:Nil];
        */
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    });
}





- (void)registerForKeyboardNotifications:(UIScrollView *)scrollView
{
    keyboard_mainScroll = scrollView;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    if (keyboard_mainScroll != nil) {
        
        NSDictionary* info = [aNotification userInfo];
        CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        
        //UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
        //UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height + 20.0f, 0.0);
        UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height - 50.0f, 0.0);
        keyboard_mainScroll.contentInset = contentInsets;
        keyboard_mainScroll.scrollIndicatorInsets = contentInsets;
        
        // If active text field is hidden by keyboard, scroll it so it's visible
        // Your app might not need or want this behavior.
        CGRect aRect = self.view.frame;
        aRect.size.height -= kbSize.height;
        if (!CGRectContainsPoint(aRect, keyboard_activeField.frame.origin)) {
            [keyboard_mainScroll scrollRectToVisible:keyboard_activeField.frame animated:YES];
        }
        
    }
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    if (keyboard_mainScroll) {
        UIEdgeInsets contentInsets = UIEdgeInsetsZero;
        keyboard_mainScroll.contentInset = contentInsets;
        keyboard_mainScroll.scrollIndicatorInsets = contentInsets;
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (keyboard_mainScroll) {
        keyboard_activeField = textField;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (keyboard_mainScroll) {
        keyboard_activeField = nil;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

/*
 - (void)keyboardWasShown:(NSNotification*)aNotification {
 NSDictionary* info = [aNotification userInfo];
 CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
 CGRect bkgndRect = activeField.superview.frame;
 bkgndRect.size.height += kbSize.height;
 [activeField.superview setFrame:bkgndRect];
 [scrollView setContentOffset:CGPointMake(0.0, activeField.frame.origin.y-kbSize.height) animated:YES];
 }
 */

- (void)hideHomeButton
{
    [self.navigationItem setRightBarButtonItem:nil];
}
- (IBAction)btnHomeClick:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)hideBackButton
{
    [self.navigationItem setHidesBackButton:YES];
}
- (void)showBackButton
{
    [self.navigationItem setHidesBackButton:NO];
}
- (void)showCloseButton
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(btnCloseClick:)];
}

- (void)showCrossButton
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[self.helper imageResize:[UIImage imageNamed:@"cross"] scaledToSize:CGSizeMake(20.0f, 20.0f)] style:UIBarButtonItemStylePlain target:self action:@selector(btnCrossClick:)];
}

- (IBAction)btnCrossClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnCloseClick:(id)sender
{
    //[self dismissViewControllerAnimated:YES completion:Nil];
    
    //[self.navigationController popViewControllerAnimated:YES];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)setNavigationBarTransparent
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
}

/*
 - (IBAction)btnNotiClick:(id)sender
 {
 [self performSegueWithIdentifier:@"seguePushNotiList" sender:self];
 }
 */

- (BOOL)passCheckLoginType:(NSString *)segue
{
    BOOL pass = NO;
    
    NSString *loginType = [self.helper loadUserDefaults:@"loginType"];
    
    //if ([loginType isEqualToString:@"finger"]) {
    if ([loginType isEqualToString:@"finger"] || [loginType isEqualToString:@"voice"]) {
        BOOL pinLogined = [[self.helper loadUserDefaults:@"pinLogined"] boolValue];
        
            pass = YES;
        
    } else {
        pass = YES;
    }
    
    return pass;
}

- (void)objView:(NSObject *)obj response:(NSDictionary *)response
{
    /*
    if ([response[@"status"] isEqualToString:@"ecoupon_open"]) {
        ECoupon *vc = (ECoupon *) [self.storyboard instantiateViewControllerWithIdentifier:@"ECoupon"];
        //vc.defaultTab = @"used";
        //vc.defaultTab = @"active";
        if (![self.helper isNull:response[@"tab"]] && ![response[@"tab"] isEqualToString:@""]) {
            vc.defaultTab = response[@"tab"];
        } else {
            vc.defaultTab = @"active";
        }
        
        [self.navigationController pushViewController:vc animated:NO];
    }
    */
    
    if ([self.delegate respondsToSelector:@selector(objView:response:)]) {
    }
}

/*
 - (void)showAlert
 {
 if (alert == nil) {
 alert = (Alert *) [self.storyboard instantiateViewControllerWithIdentifier:@"Alert"];
 
 alert.delegate = self;
 
 [alert.view setHidden:YES];
 
 alert.view.frame = self.view.frame;
 [self.view addSubview:alert.view];
 
 [self addChildViewController:alert];
 }
 
 if (alert) {
 [alert reset];
 
 [alert showStatus:YES];
 
 [alert setMessage:@"test test test test"];
 
 [alert setBtnOneTitle:@"Cancel"];
 [alert setBtnOneColor:[UIColor redColor]];
 
 [alert setBtnTwoTitle:@"OK"];
 
 [alert showBackground];
 
 [alert setBtnOneHandler:^(BOOL clicked) {
 NSLog(@"btnOneClicked");
 }];
 
 [alert setBtnTwoHandler:^(BOOL clicked) {
 NSLog(@"btnTwoClicked");
 }];
 
 [alert.view setHidden:NO];
 }
 }
 */

- (void)showAlert:(NSString *)message
{
    
}
- (void)showAlert:(NSString *)message success:(BOOL)success
{
    
}

- (void)showAlert:(NSString *)message success:(BOOL)success closeBtnHandler:(void(^)(BOOL))closeBtnHandler
{
    
}

- (void)showAlert:(NSString *)message closeBtnTitle:(NSString *)closeBtnTitle
{
    
}

- (void)showAlert:(NSString *)message okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)message success:(BOOL)success okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)message closeBtnTitle:(NSString *)closeBtnTitle okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)message okBtnTitle:(NSString *)okBtnTitle okBtnColor:(UIColor *)okBtnColor okBtnHandler:(void(^)(BOOL))okBtnHandler closeBtnTitle:(NSString *)closeBtnTitle closeBtnColor:(UIColor *)closeBtnColor
{
    
}

- (void)showAlert:(NSString *)message success:(BOOL)success closeBtnTitle:(NSString *)closeBtnTitle okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)message closeBtnTitle:(NSString *)closeBtnTitle closeBtnHandler:(void(^)(BOOL))closeBtnHandler okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message closeBtnTitle:(NSString *)closeBtnTitle closeBtnHandler:(void(^)(BOOL))closeBtnHandler okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message success:(BOOL)success
{
   
}

- (void)showAlert:(NSString *)title message:(NSString *)message success:(BOOL)success closeBtnHandler:(void(^)(BOOL))closeBtnHandler
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message closeBtnTitle:(NSString *)closeBtnTitle
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message success:(BOOL)success okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message closeBtnTitle:(NSString *)closeBtnTitle okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message okBtnTitle:(NSString *)okBtnTitle okBtnColor:(UIColor *)okBtnColor okBtnHandler:(void(^)(BOOL))okBtnHandler closeBtnTitle:(NSString *)closeBtnTitle closeBtnColor:(UIColor *)closeBtnColor
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message success:(BOOL)success closeBtnTitle:(NSString *)closeBtnTitle okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML icon:(UIImage *)icon iconSize:(CGSize)iconSize
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML icon:(UIImage *)icon iconSize:(CGSize)iconSize closeBtnHandler:(void(^)(BOOL))closeBtnHandler
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML icon:(UIImage *)icon iconSize:(CGSize)iconSize closeBtnTitle:(NSString *)closeBtnTitle
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML icon:(UIImage *)icon iconSize:(CGSize)iconSize okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML icon:(UIImage *)icon iconSize:(CGSize)iconSize closeBtnTitle:(NSString *)closeBtnTitle okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML icon:(UIImage *)icon iconSize:(CGSize)iconSize okBtnTitle:(NSString *)okBtnTitle okBtnColor:(UIColor *)okBtnColor okBtnHandler:(void(^)(BOOL))okBtnHandler closeBtnTitle:(NSString *)closeBtnTitle closeBtnColor:(UIColor *)closeBtnColor
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML success:(BOOL)success okBtnTitle:(NSString *)okBtnTitle okBtnHandler:(void(^)(BOOL))okBtnHandler
{
    
}

- (void)showAlert:(NSString *)title message:(NSString *)message isHTML:(BOOL)isHTML showStatus:(BOOL)showStatus isSuccess:(BOOL)isSuccess icon:(UIImage *)icon iconSize:(CGSize)iconSize showBG:(BOOL)showBG btnOneTitle:(NSString *)btnOneTitle btnOneColor:(UIColor *)btnOneColor btnOneHandler:(void(^)(BOOL))btnOneHandler btnTwoTitle:(NSString *)btnTwoTitle btnTwoColor:(UIColor *)btnTwoColor btnTwoHandler:(void(^)(BOOL))btnTwoHandler
{
    //NSLog(@"showAlert");
    
    if (alert == nil) {
        //alert = (Alert *) [self.storyboard instantiateViewControllerWithIdentifier:@"Alert"];
        alert = (AlertNew *) [self.storyboard instantiateViewControllerWithIdentifier:@"AlertNew"];
        
        
        /*
         alert.delegate = self;
         
         [alert.view setHidden:YES];
         
         alert.view.frame = self.view.frame;
         [self.view addSubview:alert.view];
         
         [self addChildViewController:alert];
         */
        
        
        /*
         [alert setModalPresentationStyle:UIModalPresentationOverCurrentContext];
         
         [self presentViewController:alert animated:NO completion:nil];
         */
        
        
        alert.delegate = self;
        
        [alert.view setHidden:YES];
        
        //alert.view.frame = self.view.frame;
        //[self.view addSubview:alert.view];
        
        UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
        [currentWindow addSubview:alert.view];
        //[[(AppDelegate *)[UIApplication sharedApplication].delegate window] addSubview:alert.view];
        //[currentWindow setUserInteractionEnabled:YES];
        
        /*
         [alert.btnOne addTarget:self action:@selector(alertBtnOneClick:) forControlEvents:UIControlEventTouchUpInside];
         [alert.btnTwo addTarget:self action:@selector(alertBtnTwoClick:) forControlEvents:UIControlEventTouchUpInside];
         */
    }
    
    if (alert) {
        [alert reset];
        
        if (icon != nil) {
            [alert showIcon:icon width:iconSize.width height:iconSize.height];
        } else {
            if (showStatus) {
                [alert showStatus:isSuccess];
            }
        }
        
        if (showBG) {
            [alert showBackground];
        }
        
        [alert setMessageTitle:title];
        
        if (message != nil && ![message isEqualToString:@""]) {
            if (isHTML) {
                [alert setMessageHTML:message];
            } else {
                [alert setMessage:message];
            }
        }
        
        if (btnOneTitle != nil && ![btnOneTitle isEqualToString:@""]) {
            [alert setBtnOneTitle:btnOneTitle];
            
            if (btnOneColor != nil) {
                [alert setBtnOneColor:btnOneColor];
            }
            
            if (btnOneHandler != nil) {
                [alert setBtnOneHandler:[btnOneHandler copy]];
            }
        }
        
        if (btnTwoTitle != nil && ![btnTwoTitle isEqualToString:@""]) {
            [alert setBtnTwoTitle:btnTwoTitle];
            
            if (btnTwoColor != nil) {
                [alert setBtnTwoColor:btnTwoColor];
            }
            
            if (btnTwoHandler != nil) {
                [alert setBtnTwoHandler:[btnTwoHandler copy]];
            }
        }
        
        
        [alert.view setHidden:NO];
    }
}

- (void)alert:(UIViewController *)obj close:(BOOL)close
{
    //[self alertClose];
    
    //NSLog(@"close");
    
    [alert.view setHidden:YES];
}

/*
 - (IBAction)alertBtnOneClick:(id)sender
 {
 NSLog(@"(ObjView)btnOneClick");
 
 if (_alertBtnOneHandler != nil) {
 _alertBtnOneHandler(YES);
 }
 
 [self alertClose];
 }
 - (IBAction)alertBtnTwoClick:(id)sender
 {
 NSLog(@"(ObjView)btnTwoClick");
 
 if (_alertBtnTwoHandler != nil) {
 _alertBtnTwoHandler(YES);
 }
 
 [self alertClose];
 }
 - (void)alertClose
 {
 NSLog(@"close");
 
 [alert.view setHidden:YES];
 }
 */


- (void)startProcessing
{
   
}

- (void)startProcessing:(NSString *)title message:(NSString *)message
{
    //NSLog(@"showAlert");
    
   
}

- (void)stopProcessing
{
    
}

- (BOOL)isLogined
{
    
    
    //return ([authHelper isLogined] && [[self.helper loadUserDefaults:@"loginMode"] boolValue]);
}

- (void)genHeroMenu:(UICollectionView *)collectionHeroMenu activedMenu:(NSString *)activedMenu
{
    heroMenu_activedMenu = activedMenu;
    
    self.collectionHeroMenu = collectionHeroMenu;
    
    self.collectionHeroMenu.delegate = self;
    self.collectionHeroMenu.dataSource = self;
    [self.collectionHeroMenu registerNib:[UINib nibWithNibName:@"DashboardMenuCell" bundle:nil] forCellWithReuseIdentifier:@"menuCell"];
    
    
    menuList = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *data;
    
    data = [[NSMutableDictionary alloc] init];
    [data setObject:@"coupon" forKey:@"code"];
    [data setObject:@"menuhero_coupon" forKey:@"img"];
    [data setObject:[NSNumber numberWithBool:NO] forKey:@"actived"];
    [data setObject:[NSNumber numberWithBool:YES] forKey:@"noti_count"];
    /*
    if ([self isLogined]) {
        PushNotiCount *notiCount = [self.helper getPushNotiCount];
        //NSLog(@"count: %@",notiCount.eCoupon);
        [data setObject:notiCount.eCoupon forKey:@"count"];
    }
    */
    [menuList addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setObject:@"promotion" forKey:@"code"];
    [data setObject:@"menuhero_promotion" forKey:@"img"];
    [data setObject:[NSNumber numberWithBool:NO] forKey:@"actived"];
    [data setObject:[NSNumber numberWithBool:NO] forKey:@"noti_count"];
    [menuList addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setObject:@"card" forKey:@"code"];
    [data setObject:@"menuhero_card" forKey:@"img"];
    [data setObject:[NSNumber numberWithBool:NO] forKey:@"actived"];
    [data setObject:[NSNumber numberWithBool:NO] forKey:@"noti_count"];
    [menuList addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setObject:@"register" forKey:@"code"];
    [data setObject:@"menuhero_register" forKey:@"img"];
    [data setObject:[NSNumber numberWithBool:NO] forKey:@"actived"];
    [data setObject:[NSNumber numberWithBool:NO] forKey:@"noti_count"];
    [menuList addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setObject:@"more" forKey:@"code"];
    [data setObject:@"menuhero_more" forKey:@"img"];
    [data setObject:[NSNumber numberWithBool:NO] forKey:@"actived"];
    [data setObject:[NSNumber numberWithBool:NO] forKey:@"noti_count"];
    [menuList addObject:data];
    
    //NSLog(@"menuList:\n%@", menuList);
    
    [self.collectionHeroMenu reloadData];
}

- (void)reloadHeroMenu
{
    if (menuList != nil) {
        [self.collectionHeroMenu reloadData];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = 0;
    
    if (collectionView == self.collectionHeroMenu) {
        if (menuList != nil) {
            count = [menuList count];
        }
    }
    
    //NSLog(@"menu_count = %ld", count);
    
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell;
    
    if (collectionView == self.collectionHeroMenu) {
        
        NSString *MyIdentifier = @"menuCell";
        
        
        
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeZero;
    
    if (collectionView == self.collectionHeroMenu) {
        /*
        CGFloat col_num = 5.0f;
        
        CGFloat width = (self.viewMenu.frame.size.width / col_num);
        CGFloat height = self.viewMenu.frame.size.height;
        */
        
        NSInteger col_num = [menuList count];
        
        CGFloat width = (self.view.frame.size.width / col_num);
        CGFloat height = self.collectionHeroMenu.frame.size.height;
        
        size = CGSizeMake(width, height);
    }
    
    return size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.collectionHeroMenu) {
        
        NSDictionary *data = (NSDictionary *) [menuList objectAtIndex:indexPath.row];
        
        if (![data[@"code"] isEqualToString:heroMenu_activedMenu]) {
            
            //NSLog(@"Menu: %@", data[@"code"]);
            
            //UIViewController *target;
            ObjView *target;
            
            if ([data[@"code"] isEqualToString:@"coupon"]) {
                
                //ECoupon *vc = (ECoupon *) [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ECoupon"];
                //target = (UIViewController *) vc;
                
                    
                    [self.helper checkServiceAvailable:self callback:^(BOOL success) {
                        [self checkMemberStatus:YES];
                    }];
            } else if ([data[@"code"] isEqualToString:@"promotion"]) {
                
                if ([self isLogined]) {
                    target = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CampaignHistory"];
                } else {
                    [self.helper checkServiceAvailable:self callback:^(BOOL success) {
                        [self checkMemberStatus:YES];
                    }];
                    
                    return;
                }
                
            } else if ([data[@"code"] isEqualToString:@"card"]) {
                
                //target = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SplashTap"];
                
                NSString *schemaURL = [NSString stringWithFormat:@"%@://", self.global.schema_TapKTC];
    
                if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:schemaURL]]) {
                    
                    target = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SplashTap"];
                    
                } else {
                    
                    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/app/id%@", self.global.appID_TapKTC];
                    //NSLog(@"url: %@", url);
                    
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
                    
                }
                
            } else if ([data[@"code"] isEqualToString:@"register"]) {
                
                target = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ApplyKTC"];
                
            } else if ([data[@"code"] isEqualToString:@"more"]) {
                
                target = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Menu"];
                target.delegate = self;
                
            }
            
            if (target != nil) {
                UINavigationController *nav = self.navigationController;
                [nav popToRootViewControllerAnimated:NO];
                [nav pushViewController:target animated:YES];
            }
            
        }
        
    }
}

//- (void)checkMemberStatus
- (void)checkMemberStatus:(BOOL)showStartPage
{
    if ([[self.helper loadUserDefaults:@"registered"] boolValue]) {
        
        
        
    } else {
        
        [self startLoading];
        
        NSString *url = [self.global getWebServiceURL:@"check-status/check-member"];
        
        NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
        
        [self.helper apiRequest:self url:url method:@"POST" params:params paramsFiles:nil hideAlert:YES useToken:NO success:^(id response) {
            
            [self stopLoading];
            
            BOOL isMember = [response[@"member"] boolValue];
            
            if (isMember) {
                
            } else {
                /*
                RegisterTerm *vc = (RegisterTerm *) [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterTerm"];
                [self presentViewController:vc animated:YES completion:nil];
                */
                
                /*
                RegisterTerm *vc = (RegisterTerm *) [self.storyboard instantiateViewControllerWithIdentifier:@"Start"];
                [self presentViewController:vc animated:YES completion:nil];
                */
                
                UIViewController *vc;
                
                if (showStartPage) {
                    vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Start"];
                } else {
                    
                }
                
                [self presentViewController:vc animated:YES completion:nil];
            }
            
        } fail:^(id response) {
            
            [self stopLoading];
            
        }];
        
    }
}

@end
