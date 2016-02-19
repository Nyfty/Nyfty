//
//  EnterPhoneNumerVC.h
//  Nyfty
//
//  Created by Toqeer Ahmad on 2/19/16.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterPhoneNumerVC : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIButton *cancelText;
@property (nonatomic, weak) IBOutlet UIButton *BtnConfirmation;
@property (nonatomic, weak) IBOutlet UITextField *textPhoneNumber;
@property (nonatomic, weak) IBOutlet UILabel *lblCountryCode;
@property (nonatomic, weak) IBOutlet UILabel *lblTop;
@property (nonatomic, weak) IBOutlet UILabel *lblDetail;
@property (nonatomic, weak) IBOutlet UIImageView *countryFlagImage;

@end
