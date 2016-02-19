//
//  VehicleMakeViewController.m
//  Nyfty
//
//  Created by Toqeer Ahmad on 2/19/16.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import "VehicleMakeViewController.h"
#import "VehicleInfoViewController.h"
#import "SelectedModelTableViewCell.h"
@interface VehicleMakeViewController ()
{
    NSDictionary *makeDict;
    NSArray *makeSectionTitles;
    NSArray *makeIndexTitles;
    NSMutableArray *resultArray;
    NSMutableArray *matchedArray;
    NSArray *resultDict;
    BOOL isSearching;
    NSString *searchingText;
    SelectedModelTableViewCell *cellMake;
    
}
@property (nonatomic, retain) NSMutableArray *filteredListContent;

@end

@implementation VehicleMakeViewController

@synthesize makeTableView,searchMakeBar,lblSelectedMake,tickImage,filteredListContent;

- (void)viewDidLoad {
    [super viewDidLoad];
    resultArray = [[NSMutableArray alloc] init];
    matchedArray = [[NSMutableArray alloc] init];
    makeDict = @{@"A" : @[@"Agya", @"Allion", @"Alphard", @"Aurion"],
                 @"B" : @[@"bB", @"Belta", @"Baldwick"],
                 @"C" : @[@"Camry", @"Carri", @"Century"],
                 @"E" : @[@"Emu"],
                 @"G" : @[@"Giraffe", @"Greater Rhea"],
                 @"H" : @[@"Hippopotamus", @"Horse"],
                 @"K" : @[@"Koala"],
                 @"L" : @[@"Lion", @"Llama"],
                 @"M" : @[@"Manatus", @"Meerkat"],
                 @"P" : @[@"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear"],
                 @"R" : @[@"Rhinoceros"],
                 @"S" : @[@"Seagull"],
                 @"T" : @[@"Tasmania Devil"],
                 @"W" : @[@"Whale", @"Whale Shark", @"Wombat"]};
    
    makeSectionTitles = [[makeDict allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    makeIndexTitles = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];

}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (isSearching) {
        return 1;
    }else
        return [makeSectionTitles count] ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isSearching) {
        return [matchedArray count];
    }else{
        NSString *sectionTitle = [makeSectionTitles objectAtIndex:section];
        NSArray *sectionAnimals = [makeDict objectForKey:sectionTitle];
        return [sectionAnimals count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (isSearching) {
        return @"";
    }else
        return [makeSectionTitles objectAtIndex:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (isSearching) {
        cell.textLabel.text = [matchedArray objectAtIndex:indexPath.row];
    }else{
        NSString *sectionTitle = [makeSectionTitles objectAtIndex:indexPath.section];
        NSArray *sectionmake = [makeDict objectForKey:sectionTitle];
        NSString *make = [sectionmake objectAtIndex:indexPath.row];
        cell.textLabel.text = make;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (isSearching) {
        lblSelectedMake.text = [matchedArray objectAtIndex:indexPath.row];
        tickImage.hidden = false;
    }else{
        NSString *sectionTitle = [makeSectionTitles objectAtIndex:indexPath.section];
        NSArray *sectionmake = [makeDict objectForKey:sectionTitle];
        NSString *make = [sectionmake objectAtIndex:indexPath.row];
        lblSelectedMake.text = make;
        tickImage.hidden = false;
    }
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return makeIndexTitles;
}

-(IBAction)pushToVehicleInfo:(id)sender
{
    [ModelLocator getInstance].makeName = lblSelectedMake.text;
    [self.navigationController popViewControllerAnimated:true];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [makeSectionTitles indexOfObject:title];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    [self startSearch:searchText];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton=YES;
    return YES;
}

-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.showsCancelButton=NO;
    [searchBar resignFirstResponder];
    isSearching = false;
    searchBar.text = @"";
    [makeTableView reloadData];
}

-(void)startSearch:(NSString *)text
{
    [matchedArray removeAllObjects];
    isSearching = true;
    if (![text isEqualToString:@""]) {
        searchingText = [text substringToIndex:1];
        resultArray = [makeDict objectForKey:searchingText];
        
        for (int i=0; i < [resultArray count]; i++) {
            NSString *sectionTitle = [resultArray objectAtIndex:i];
            if ([sectionTitle hasPrefix:text]) {
                [matchedArray addObject:sectionTitle];
            }
        }
    }
    [makeTableView reloadData];
}

-(IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
