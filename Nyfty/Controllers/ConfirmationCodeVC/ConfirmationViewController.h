//
//  ConfirmationViewController.h
//  Nyfty
//
//  Created by Atif Mehmood on 19/02/2016.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmationViewController : UIViewController<UITextFieldDelegate>
{
    NSString *confirmingCode;
}
@property (nonatomic , strong) IBOutlet UIView *view1;
@property (nonatomic , strong) IBOutlet UIView *view2;
@property (nonatomic , strong) IBOutlet UIView *view3;
@property (nonatomic , strong) IBOutlet UIView *view4;
@property (nonatomic , strong) IBOutlet UIView *view5;
@property (nonatomic , strong) IBOutlet UIView *view6;

@property (nonatomic , strong) IBOutlet UITextField *textField1;
@property (nonatomic , strong) IBOutlet UITextField *textField2;
@property (nonatomic , strong) IBOutlet UITextField *textField3;
@property (nonatomic , strong) IBOutlet UITextField *textField4;
@property (nonatomic , strong) IBOutlet UITextField *textField5;
@property (nonatomic , strong) IBOutlet UITextField *textField6;

@property (nonatomic , strong) IBOutlet UIButton *btnRequestAnother;
@property (nonatomic , strong) IBOutlet UILabel *lblVerifying;
@property (nonatomic , strong) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic , strong) IBOutlet UIButton *btnNext;
@property (nonatomic , strong) IBOutlet UIButton *btnArrow;
@property (nonatomic , strong) IBOutlet UIImageView *checkMarkImageview;



@end
