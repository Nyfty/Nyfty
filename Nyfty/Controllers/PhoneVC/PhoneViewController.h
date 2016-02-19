//
//  PhoneViewController.h
//  Nyfty
//
//  Created by Atif Mehmood on 19/02/2016.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryListViewController.h"

@interface PhoneViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic , strong) IBOutlet UIButton *btnFlag;
@property (nonatomic , strong) IBOutlet UIButton *btnCross;
@property (nonatomic , strong) IBOutlet UIButton *btnSendCode;
@property (nonatomic , strong) IBOutlet UITextField *phoneNumberTextfield;
@property (nonatomic , strong) IBOutlet UIImageView *airPlaneImageview;
@property (nonatomic , strong) IBOutlet UIActivityIndicatorView *indicatorview;


@end


