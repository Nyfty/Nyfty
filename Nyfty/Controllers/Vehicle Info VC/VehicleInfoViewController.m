//
//  VehicleInfoViewController.m
//  Nyfty
//
//  Created by Toqeer Ahmad on 2/18/16.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import "VehicleInfoViewController.h"

@interface VehicleInfoViewController ()
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *rightConstraint;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *widthOfColorBtns;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *heightOfColorBtns;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *carBottomSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelDetailBottomSapce;
@property (weak, nonatomic) IBOutlet UILabel *lblDetail;

@end

@implementation VehicleInfoViewController

@synthesize colorBtns,carImageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    previousSelectedTag = 5;
    
    for (UIButton *button in colorBtns) {
        if (button.tag == previousSelectedTag) {
            UIImageView *checkImageView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 24, 24)];
            [checkImageView setImage:[UIImage imageNamed:@"checkmark-white"]];
            [button addSubview:checkImageView];
        }
        
    }
    
    for(NSLayoutConstraint *constraint in self.rightConstraint)
    {
        if (IS_IPHONE_6){
            constraint.constant = 16;
        }
    }
    for(NSLayoutConstraint *constraint in self.widthOfColorBtns)
    {
        if (IS_IPHONE_5) {
            constraint.constant = 28;
            self.carBottomSpace.constant = 35;
            self.labelDetailBottomSapce.constant = 35;
            self.lblDetail.font = [UIFont fontWithName:@"Raleway-Medium" size:11];
        }else if (IS_IPHONE_6){
            constraint.constant = 38;
            self.lblDetail.font = [UIFont fontWithName:@"Raleway-Medium" size:13];
        }
    }
    for(NSLayoutConstraint *constraint in self.heightOfColorBtns)
    {
        if (IS_IPHONE_5) {
            constraint.constant = 28;
        }else if (IS_IPHONE_6){
            constraint.constant = 38;
        }
    }
    
    for( UIButton *button in colorBtns)
    {
        if (IS_IPHONE_6) {
            button.layer.cornerRadius = 38/2;
        }else if (IS_IPHONE_5){
            button.layer.cornerRadius = 28/2;
        }else{
            button.layer.cornerRadius = button.frame.size.width/2;
        }
        if(button.tag == 0)
        {
            button.layer.borderWidth = 1.0f;
            button.layer.borderColor = ([UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1.0].CGColor);
        }
        button.layer.masksToBounds = true;
    }
    
}

- (IBAction)ColorBtnsAction:(id)sender
{
    selectedBtnTag = (int)[sender tag];
    NSLog(@"Selected Button = %d",selectedBtnTag);
    UIButton *btn = (UIButton*)sender;
    for (UIButton *button in colorBtns) {
        if (button.tag == previousSelectedTag) {
            for (UIView *subview in button.subviews) {
                if ([subview isKindOfClass:[UIImageView class]]) {
                    [subview removeFromSuperview];
                }
            }
        }
        if ([button isEqual:btn]) {
            if (button.tag == 0 || button.tag == 1) {
                UIImageView *checkImageView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 24, 24)];
                [checkImageView setImage:[UIImage imageNamed:@"checkmark-darkblue"]];
                [button addSubview:checkImageView];
            }else{
                UIImageView *checkImageView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 24, 24)];
                [checkImageView setImage:[UIImage imageNamed:@"checkmark-white"]];
                [button addSubview:checkImageView];
            }
            
        }
    }
    
    previousSelectedTag = selectedBtnTag;
    [self setImageOfCar:selectedBtnTag];
}

-(void)setImageOfCar:(int)tag
{
    switch (tag) {
        case 0:
            carImageView.image = [UIImage imageNamed:@"Sample-Car-Silhouette-White"];
            break;
        case 1:
            carImageView.image = [UIImage imageNamed:@"Sample-Car-Silhouette-Yellow"];
            break;
            
        case 2:
            carImageView.image = [UIImage imageNamed:@"Sample-Car-Silhouette-Orange"];
            break;
        case 3:
            carImageView.image = [UIImage imageNamed:@"Sample-Car-Silhouette-Green"];
            break;
        case 4:
            carImageView.image = [UIImage imageNamed:@"Sample-Car-Silhouette-Red"];
            break;
        case 5:
            carImageView.image = [UIImage imageNamed:@"Sample-Car-Silhouette-purple"];
            break;
        case 6:
            carImageView.image = [UIImage imageNamed:@"Sample-Car-Silhouette-Pink"];
            break;
        case 7:
            carImageView.image = [UIImage imageNamed:@"Sample-Car-Silhouette-Blue"];
            break;
        case 8:
            carImageView.image = [UIImage imageNamed:@"Sample-Car-Silhouette-Grey"];
            break;
        case 9:
            carImageView.image = [UIImage imageNamed:@"Sample-Car-Silhouette-Brown"];
            break;
        case 10:
            carImageView.image = [UIImage imageNamed:@"Sample-Car-Silhouette-Black"];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
