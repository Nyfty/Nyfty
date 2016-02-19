//
//  EnterPhoneNumerVC.m
//  Nyfty
//
//  Created by Toqeer Ahmad on 2/19/16.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import "EnterPhoneNumerVC.h"

@interface EnterPhoneNumerVC ()
{
    int distance;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *countryCodeConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldDownConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldRightContrsint;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation EnterPhoneNumerVC
@synthesize cancelText,countryFlagImage,textPhoneNumber,lblCountryCode,BtnConfirmation;
- (void)viewDidLoad {
    [super viewDidLoad];
    if (IS_IPHONE_5){
        distance = 130;
        self.countryCodeConstraint.constant = 3;
        self.textFieldRightContrsint.constant = 17;
    }
    else if (IS_IPHONE_6){
        distance = 60;
        self.textFieldDownConstraint.constant = 0;
    }
    
    
    [self.lblDetail setFont:[UIFont fontWithName:self.lblDetail.font.familyName size:[ApplicationHelper returnFontSizeWithDynamicSize:self.lblDetail.font.pointSize]]];
    [self.lblTop setFont:[UIFont fontWithName:self.lblTop.font.familyName size:[ApplicationHelper returnFontSizeWithDynamicSize:self.lblTop.font.pointSize]]];
    [self.lblCountryCode setFont:[UIFont fontWithName:self.lblCountryCode.font.familyName size:[ApplicationHelper returnFontSizeWithDynamicSize:self.lblCountryCode.font.pointSize]]];

}


-(IBAction)clearTextField:(id)sender
{
    textPhoneNumber.text = @"";
}

-(IBAction)BtnConfirmationAction:(id)sender
{
    [BtnConfirmation setImage:[UIImage imageNamed:@"Sending-Confirmation"] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:self.activityIndicator];
    self.activityIndicator.hidden = false;
    [self.activityIndicator startAnimating];

}

-(IBAction)goBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [ApplicationHelper animateTextFieldUp:true viewToMove:self.view DistanceToMove:distance AnimationDuration:0.3];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [ApplicationHelper animateTextFieldUp:false viewToMove:self.view DistanceToMove:distance AnimationDuration:0.3];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
//    __block NSString *text = [textField text];
    
    if (textField == textPhoneNumber) {
        
        if ([string isEqualToString:@"*"] || [string isEqualToString:@";"] || [string isEqualToString:@"#"] || [string isEqualToString:@","]) {
            return NO;
        }else
        {
            int length = [self getLength:textField.text];
            
            if(length == 10)
            {
                if(range.length == 0)
                    return NO;
            }
            
            if(length == 3)
            {
                NSString *num = [self formatNumber:textField.text];
                textField.text = [NSString stringWithFormat:@"(%@) ",num];
                if(range.length > 0)
                    textField.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
            }
            else if(length == 6)
            {
                NSString *num = [self formatNumber:textField.text];
                
                textField.text = [NSString stringWithFormat:@"(%@) %@-",[num  substringToIndex:3],[num substringFromIndex:3]];
                if(range.length > 0)
                    textField.text = [NSString stringWithFormat:@"(%@) %@",[num substringToIndex:3],[num substringFromIndex:3]];
            }
            
            return YES;
        }
    }
    return YES;
}

-(NSString*)formatNumber:(NSString*)mobileNumber
{
    
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    NSLog(@"%@", mobileNumber);
    
    int length = (int)[mobileNumber length];
    if(length > 10)
    {
        mobileNumber = [mobileNumber substringFromIndex: length-10];
        NSLog(@"%@", mobileNumber);
        
    }
    
    
    return mobileNumber;
}


-(int)getLength:(NSString*)mobileNumber
{
    
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    int length = (int)[mobileNumber length];
    
    return length;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
