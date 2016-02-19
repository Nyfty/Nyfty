//
//  ConfirmationViewController.m
//  Nyfty
//
//  Created by Atif Mehmood on 19/02/2016.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import "ConfirmationViewController.h"

#define ACCEPTABLE_CHARECTERS @"0123456789."

@interface ConfirmationViewController ()

@end

@implementation ConfirmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(TextFieldTextDidUpdatingNotificationOccur:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(TextFieldTextDidEndUpdateNotificationOccur:)
                                                 name:UITextFieldTextDidEndEditingNotification
                                               object:nil];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardOnScreen:) name:UIKeyboardDidShowNotification object:nil];
    [[UITextField appearance] setTintColor:[UIColor whiteColor]];
    [self.view1 setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
    [self.textField1 becomeFirstResponder];
    
    _btnRequestAnother.titleLabel. numberOfLines = 2; // Dynamic number of lines
    _btnRequestAnother.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [_activityIndicatorView setHidden:YES];
    
    int height = [[[UIApplication sharedApplication]delegate]window].frame.size.height;
    int width = [[[UIApplication sharedApplication]delegate]window].frame.size.width;
    height = height - 280;
    self.btnNext.frame = CGRectMake(0, height, width, 54);
    [self.btnArrow setFrame:CGRectMake(self.btnArrow.frame.origin.x, height+15, 24, 24)];
    IQKeyboardManager *IQKeyboardManagerObj                  = [IQKeyboardManager sharedManager];
    [IQKeyboardManagerObj disableToolbarInViewControllerClass:[self class]];
    
    [_checkMarkImageview setHidden:YES];
}

-(void)keyboardOnScreen:(NSNotification *)notification
{
    NSDictionary *info  = notification.userInfo;
    NSValue      *value = info[UIKeyboardFrameEndUserInfoKey];
    
    CGRect rawFrame      = [value CGRectValue];
    CGRect keyboardFrame = [self.view convertRect:rawFrame fromView:nil];
    
    NSLog(@"keyboardFrame: %@", NSStringFromCGRect(keyboardFrame));
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
//    NSUInteger newLength = [textField.text length] + [string length] - range.length;
//    if (newLength == 1) {
//        
//        return YES;
//    }else
//        return NO;

    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ACCEPTABLE_CHARECTERS] invertedSet];
    
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    
    return [string isEqualToString:filtered];
}

- (void)TextFieldTextDidUpdatingNotificationOccur:(NSNotification *)aNotification
{
    UITextField *textfield = (UITextField*)aNotification.object;
    NSInteger tag = textfield.tag;
    if (textfield.text.length == 1) {
        switch (tag) {
            case 0:
                [_view2 setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
                [_textField2 becomeFirstResponder];
                break;
            case 1:
                [_view3 setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
                [_textField3 becomeFirstResponder];
                break;
            case 2:
                [_view4 setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
                [_textField4 becomeFirstResponder];
                break;
            case 3:
                [_view5 setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
                [_textField5 becomeFirstResponder];
                break;
            case 4:
                [_view6 setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
                [_textField6 becomeFirstResponder];
                break;
            case 5:
                [_view6 setBackgroundColor:[UIColor lightGrayColor]];
                [self verifyingConfirmingCode];
                break;
                
            default:
                break;
        }
    }
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSInteger tag = textField.tag;
    switch (tag) {
        case 0:
            [_view1 setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
            [_view2 setBackgroundColor:[UIColor lightGrayColor]];
            [_view3 setBackgroundColor:[UIColor lightGrayColor]];
            [_view4 setBackgroundColor:[UIColor lightGrayColor]];
            [_view5 setBackgroundColor:[UIColor lightGrayColor]];
            [_view6 setBackgroundColor:[UIColor lightGrayColor]];
            break;
        case 1:
            [_view1 setBackgroundColor:[UIColor lightGrayColor]];
            [_view3 setBackgroundColor:[UIColor lightGrayColor]];
            [_view4 setBackgroundColor:[UIColor lightGrayColor]];
            [_view5 setBackgroundColor:[UIColor lightGrayColor]];
            [_view6 setBackgroundColor:[UIColor lightGrayColor]];
            [_view2 setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
            break;
        case 2:
            [_view2 setBackgroundColor:[UIColor lightGrayColor]];
            [_view1 setBackgroundColor:[UIColor lightGrayColor]];
            [_view4 setBackgroundColor:[UIColor lightGrayColor]];
            [_view5 setBackgroundColor:[UIColor lightGrayColor]];
            [_view6 setBackgroundColor:[UIColor lightGrayColor]];
            [_view3 setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
            break;
        case 3:
            [_view2 setBackgroundColor:[UIColor lightGrayColor]];
            [_view3 setBackgroundColor:[UIColor lightGrayColor]];
            [_view1 setBackgroundColor:[UIColor lightGrayColor]];
            [_view5 setBackgroundColor:[UIColor lightGrayColor]];
            [_view6 setBackgroundColor:[UIColor lightGrayColor]];
            [_view4 setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
            break;
        case 4:
            [_view2 setBackgroundColor:[UIColor lightGrayColor]];
            [_view3 setBackgroundColor:[UIColor lightGrayColor]];
            [_view4 setBackgroundColor:[UIColor lightGrayColor]];
            [_view1 setBackgroundColor:[UIColor lightGrayColor]];
            [_view6 setBackgroundColor:[UIColor lightGrayColor]];
            [_view5 setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
            break;
        case 5:
            [_view2 setBackgroundColor:[UIColor lightGrayColor]];
            [_view3 setBackgroundColor:[UIColor lightGrayColor]];
            [_view4 setBackgroundColor:[UIColor lightGrayColor]];
            [_view5 setBackgroundColor:[UIColor lightGrayColor]];
            [_view1 setBackgroundColor:[UIColor lightGrayColor]];
            [_view6 setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
            break;
            
        default:
            break;
    }
}

- (void)TextFieldTextDidEndUpdateNotificationOccur:(NSNotification *)aNotification
{
    UITextField *textfield = (UITextField*)aNotification.object;
    
    NSInteger tag = textfield.tag;
    if (textfield.text.length == 1) {
        switch (tag) {
            case 0:
                [_view1 setBackgroundColor:[UIColor lightGrayColor]];
                
                break;
            case 1:
                [_view2 setBackgroundColor:[UIColor lightGrayColor]];
                break;
            case 2:
                [_view3 setBackgroundColor:[UIColor lightGrayColor]];
                break;
            case 3:
                [_view4 setBackgroundColor:[UIColor lightGrayColor]];
                break;
            case 4:
                [_view5 setBackgroundColor:[UIColor lightGrayColor]];
                break;
            case 5:
                [_view6 setBackgroundColor:[UIColor lightGrayColor]];
                [self verifyingConfirmingCode];
                break;
                
            default:
                break;
        }
    }
}


-(void) verifyingConfirmingCode
{
    [self.btnRequestAnother setHidden:YES];
    [self.activityIndicatorView setHidden:NO];
    [self.activityIndicatorView startAnimating];
    [self.lblVerifying setHidden:NO];
    confirmingCode = [NSString stringWithFormat:@"%@%@%@%@%@%@",_textField1.text,_textField2.text,_textField3.text,_textField4.text,_textField5.text,_textField6.text];
    [self performSelector:@selector(validateConfirmingCode) withObject:nil afterDelay:0.5];
}

-(void) validateConfirmingCode
{
    if ([confirmingCode isEqualToString:@"123456"]) {
        NSLog(@"Success");
        [_lblVerifying setText:@"Confirmed!"];
        [_checkMarkImageview setHidden:NO];
        [_activityIndicatorView setHidden:YES];
        [_btnNext setBackgroundColor:[UIColor colorWithHexString:@"58AAD9"]];
        [_btnArrow setImage:[UIImage imageNamed:@"nav-arrow-forward-white"] forState:UIControlStateNormal];

    }else{
        [_checkMarkImageview setHidden:YES];
        [_activityIndicatorView setHidden:YES];
        [_lblVerifying setText:@"Invalid Code"];
        [_btnNext setBackgroundColor:[UIColor colorWithHexString:@"FF3B30"]];
        [_btnNext setTitle:@"Whoops, lets try that again" forState:UIControlStateNormal];
        [_btnArrow setImage:[UIImage imageNamed:@"code_error"] forState:UIControlStateNormal];
        
    }
}

-(IBAction)goBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
