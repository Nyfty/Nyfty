//
//  VehicleMakeViewController.h
//  Nyfty
//
//  Created by Toqeer Ahmad on 2/19/16.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VehicleMakeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UITableView *makeTableView;
@property (nonatomic, weak) IBOutlet UISearchBar *searchMakeBar;
@property (nonatomic, weak) IBOutlet UIButton *tickImage;
@property (nonatomic, weak) IBOutlet UILabel *lblSelectedMake;

@end
