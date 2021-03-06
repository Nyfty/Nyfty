//
//  LoginViewController.m
//  Nyfty
//
//  Created by Atif Mehmood on 17/02/2016.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import "LoginViewController.h"
#import "SelfieViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.loginTableView.tableHeaderView = self.loginHeaderView;
    self.loginTableView.tableFooterView = [[UIView alloc] init];
    self.btnFacebook.layer.cornerRadius = 3.33f;
}

-(IBAction)backButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)loginButtonPressed:(id)sender
{
    SelfieViewController *selfieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SelfieViewController_Id"];
    [self.navigationController pushViewController:selfieVC animated:YES];
}

#pragma mark UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *regCell = nil;
    if (indexPath.row == 0)
    {
        regCell = self.emailCell;
        
    }
    else if (indexPath.row == 1)
    {
        regCell = self.passwordCell;
        
    }
    else if (indexPath.row == 2)
    {
        regCell = self.forgotPasswordCell;
        
    }
    
    
    return regCell;
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
