//
//  RegistrationViewController.h
//  Nyfty
//
//  Created by Atif Mehmood on 17/02/2016.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistrationTableViewCell.h"

@interface RegistrationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic , strong) IBOutlet RegistrationTableViewCell *firstNameCell;
@property (nonatomic , strong) IBOutlet RegistrationTableViewCell *lastNameCell;
@property (nonatomic , strong) IBOutlet RegistrationTableViewCell *emailCell;
@property (nonatomic , strong) IBOutlet RegistrationTableViewCell *passwordCell;
@property (nonatomic , strong) IBOutlet RegistrationTableViewCell *confirmPasswordCell;
@property (nonatomic , strong) IBOutlet UIView *registrationHeaderView;
@property (nonatomic , strong) IBOutlet UIView *registrationFooterView;
@property (nonatomic , strong) IBOutlet UITableView *registrationTableView;
@property (nonatomic , strong) IBOutlet UIButton *btnFacebook;

@end
