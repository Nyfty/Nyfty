//
//  VehicleModelViewController.h
//  Nyfty
//
//  Created by Toqeer Ahmad on 2/19/16.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VehicleModelViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UITableView *modelTableView;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBarModel;
@property (nonatomic, weak) IBOutlet UIButton *tickImage;
@property (nonatomic, weak) IBOutlet UILabel *lblSelectedModel;

@end
