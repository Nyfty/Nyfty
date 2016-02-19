//
//  LoginViewController.h
//  Nyfty
//
//  Created by Atif Mehmood on 17/02/2016.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistrationTableViewCell.h"

@interface LoginViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong) IBOutlet RegistrationTableViewCell *emailCell;
@property (nonatomic , strong) IBOutlet RegistrationTableViewCell *passwordCell;
@property (nonatomic , strong) IBOutlet UITableViewCell *forgotPasswordCell;
@property (nonatomic , strong) IBOutlet UIView *loginHeaderView;
@property (nonatomic , strong) IBOutlet UIView *loginFooterView;
@property (nonatomic , strong) IBOutlet UITableView *loginTableView;
@property (nonatomic , strong) IBOutlet UIButton *btnFacebook;

@end
