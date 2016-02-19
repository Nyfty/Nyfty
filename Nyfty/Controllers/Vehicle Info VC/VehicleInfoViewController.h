//
//  VehicleInfoViewController.h
//  Nyfty
//
//  Created by Toqeer Ahmad on 2/18/16.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VehicleInfoViewController : UIViewController
{
    int selectedBtnTag;
    int previousSelectedTag;
}
@property (nonatomic, retain) IBOutletCollection(UIButton) NSArray *colorBtns;
@property (nonatomic, weak) IBOutlet UIImageView *carImageView;
@property (nonatomic, weak) IBOutlet UIButton *vehicleMakeBtn;
@property (nonatomic, weak) IBOutlet UIButton *vehicleModelBtn;

@property (nonatomic, strong) ModelLocator *model;


@end
