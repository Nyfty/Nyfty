//
//  VehicleModelViewController.m
//  Nyfty
//
//  Created by Toqeer Ahmad on 2/19/16.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import "VehicleModelViewController.h"
#import "VehicleInfoViewController.h"
@interface VehicleModelViewController ()
{
    NSDictionary *modelsDict;
    NSArray *modelSectionTitles;
    NSArray *modelIndexTitles;
    NSMutableArray *resultArray;
    NSArray *resultDict;
    BOOL isSearching;
    NSString *searchingText;
    NSMutableArray *matchedArray;
}
@end

@implementation VehicleModelViewController

@synthesize modelTableView,searchBarModel,tickImage,lblSelectedModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    matchedArray = [[NSMutableArray alloc] init];
    resultArray = [[NSMutableArray alloc] init];
    modelsDict = @{@"A" : @[@"Acura", @"Alfa Romeo", @"Aston Martin", @"Audi"],
                @"B" : @[@"Bentley", @"BMW", @"Buick"],
                @"C" : @[@"Cadillac", @"Chevrolet", @"Chrysler"],
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
    
    modelSectionTitles = [[modelsDict allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    modelIndexTitles = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    
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
        return [modelSectionTitles count];
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
        NSString *sectionTitle = [modelSectionTitles objectAtIndex:section];
        NSArray *sectionAnimals = [modelsDict objectForKey:sectionTitle];
        return [sectionAnimals count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (isSearching) {
        return searchingText;
    }else
        return [modelSectionTitles objectAtIndex:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (isSearching) {
        cell.textLabel.text = [resultArray objectAtIndex:indexPath.row];
    }else{
        NSString *sectionTitle = [modelSectionTitles objectAtIndex:indexPath.section];
        NSArray *sectionAnimals = [modelsDict objectForKey:sectionTitle];
        NSString *animal = [sectionAnimals objectAtIndex:indexPath.row];
        cell.textLabel.text = animal;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (isSearching) {
        lblSelectedModel.text = [matchedArray objectAtIndex:indexPath.row];
        tickImage.hidden = false;
    }else{
        NSString *sectionTitle = [modelSectionTitles objectAtIndex:indexPath.section];
        NSArray *sectionmake = [modelsDict objectForKey:sectionTitle];
        NSString *make = [sectionmake objectAtIndex:indexPath.row];
        lblSelectedModel.text = make;
        tickImage.hidden = false;
    }}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //  return animalSectionTitles;
    return modelIndexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [modelIndexTitles indexOfObject:title];
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
    [modelTableView reloadData];
}

-(void)startSearch:(NSString *)text
{
    [matchedArray removeAllObjects];
    isSearching = true;
    if (![text isEqualToString:@""]) {
        searchingText = [text substringToIndex:1];
        resultArray = [modelsDict objectForKey:searchingText];
        
        for (int i=0; i < [resultArray count]; i++) {
            NSString *sectionTitle = [resultArray objectAtIndex:i];
            if ([sectionTitle hasPrefix:text]) {
                [matchedArray addObject:sectionTitle];
            }
        }
    }
    [modelTableView reloadData];
}




-(IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}

-(IBAction)pushToVehicleInfo:(id)sender
{
    [ModelLocator getInstance].modelName = lblSelectedModel.text;
    [self.navigationController popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
