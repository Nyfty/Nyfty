//
//  PhoneViewController.m
//  Nyfty
//
//  Created by Atif Mehmood on 19/02/2016.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import "PhoneViewController.h"
#import "ConfirmationViewController.h"


#pragma mark - Alert View duration

static double const kAlertMessageDuration = 7.0;
static double const kPushAlertMessageDuration = 6.0;


@interface PhoneViewController ()

@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.btnSendCode.layer.borderColor = [UIColor blackColor].CGColor;
    self.btnSendCode.layer.cornerRadius = 3.33f;
    self.btnSendCode.layer.borderWidth = 1.0f;
    [self.indicatorview setHidden:YES];
}

#pragma mark - CountriesViewControllerDelegate

//- (void)countriesViewController:(CountryViewController *)countriesViewController didSelectCountry:(NSString *)countryCode
//{
//    NSString *imagePath = [NSString stringWithFormat:@"CountryPicker.bundle/%@",countryCode];
//    UIImage *image;
//    if ([[UIImage class] respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)])
//        image = [UIImage imageNamed:imagePath inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
//    else
//        image = [UIImage imageNamed:imagePath];
//    
//    [self.btnFlag setBackgroundImage:image forState:UIControlStateNormal];
//    
//    [countriesViewController.navigationController dismissViewControllerAnimated:YES completion:nil];
//}

- (void)didSelectCountry:(NSDictionary *)country
{
    NSLog(@"%@", country);
    NSString *imagePath = [NSString stringWithFormat:@"CountryPicker.bundle/%@", [country valueForKey:kCountryCode]];
    UIImage *image;
    if ([[UIImage class] respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)])
        image = [UIImage imageNamed:imagePath inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    else
        image = [UIImage imageNamed:imagePath];
    
    [self.btnFlag setImage:nil forState:UIControlStateNormal];
    [self.btnFlag setImage:image forState:UIControlStateNormal];
    self.phoneNumberTextfield.text = [country valueForKey:kCountryCallingCode];
}


-(IBAction)changeFlag:(id)sender
{
    CountryListViewController *cv = [[CountryListViewController alloc] initWithNibName:@"CountryListViewController" delegate:self];
    //[self presentViewController:cv animated:YES completion:NULL];
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:cv] animated:YES completion:^{
        [cv setTitle:@"Select Country"];
        //[picker.navigationItem setLeftBarButtonItem:nil];
    }];
}

-(IBAction)sendConfirmationCode:(id)sender
{
    [self.view endEditing:YES];
    
    if (![self validatePhoneNumberTextfield])
    {
        return;
    }
    [self.airPlaneImageview setHidden:true];
    [self.indicatorview setHidden:false];
    [self.indicatorview startAnimating];
    [self.btnSendCode setTitle:@"Sending Confirmation........" forState:UIControlStateNormal];
    [self performSelector:@selector(moveToConfirmationCode) withObject:nil afterDelay:0.5];
    
}

-(void)moveToConfirmationCode
{
    [self.indicatorview stopAnimating];
    [self.indicatorview setHidden:YES];
    [self.airPlaneImageview setHidden:NO];
    ConfirmationViewController *confirmationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ConfirmationViewController"];
    [self.navigationController pushViewController:confirmationVC animated:true];
}

-(BOOL)validatePhoneNumberTextfield
{
    NSString *errorMsg = @"";
    if ([ValidationHelper isEmpty:_phoneNumberTextfield.text])
    {
        errorMsg = @"Please enter your phone number.";
    }
    if (![ValidationHelper isEmpty:errorMsg])
    {
        NSString *InvalidInputStr = @"Warning";
        
        //////// TSMessage
        [TSMessage showNotificationInViewController:self
                                              title:InvalidInputStr
                                           subtitle:errorMsg
                                              image:nil
                                               type:TSMessageNotificationTypeWarning
                                           duration:kAlertMessageDuration
                                           callback:nil
                                        buttonTitle:nil
                                     buttonCallback:nil
                                         atPosition:TSMessageNotificationPositionTop
                               canBeDismissedByUser:YES];
        ///////////////////////////
        
        return FALSE;
    }
    else
    {
        return TRUE;
    }
    
    return TRUE;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self.btnCross setHidden:false];
    return true;
}

-(IBAction)clearText:(id)sender
{
    self.phoneNumberTextfield.text = nil;
    
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
