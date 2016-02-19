//
//  CountryListViewController.m
//  Country List
//
//  Created by Pradyumna Doddala on 18/12/13.
//  Copyright (c) 2013 Pradyumna Doddala. All rights reserved.
//

#import "CountryListViewController.h"
#import "CountryListDataSource.h"
#import "CountryCell.h"

@interface CountryListViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataRows;
@end

@implementation CountryListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil delegate:(id)delegate
{
    self = [super initWithNibName:nibNameOrNil bundle:nil];
    if (self) {
        // Custom initialization
        _delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelEdit:)];
    self.isFiltered = NO;
    CountryListDataSource *dataSource = [[CountryListDataSource alloc] init];
    _dataRows = [dataSource countries];
    countriesArray = [NSMutableArray array];
    for (NSDictionary *dict in _dataRows) {
        [countriesArray addObject:[dict valueForKey:kCountryName]];
    }
    [_tableView reloadData];
    
}

- (void) cancelEdit: (id) sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    if(text.length == 0)
    {
        self.isFiltered = NO;
    }
    else
    {
        self.isFiltered = YES;
        self.filteredCountries = [[NSMutableArray alloc] init];
        
        for (NSString* countryName in countriesArray)
        {
            NSRange nameRange = [countryName rangeOfString:text options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound)
            {
                for (NSDictionary *dict in _dataRows) {
                    NSString *strCountryName = [dict valueForKey:kCountryName];
                    if ([countryName isEqual:strCountryName]) {
                        [self.filteredCountries addObject:dict];

                    }
                }
            }
        }
    }
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.isFiltered){
        return self.filteredCountries.count;
    }else
        return [self.dataRows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    CountryCell *cell = (CountryCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[CountryCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    if (self.isFiltered) {
        cell.textLabel.text = [[self.filteredCountries objectAtIndex:indexPath.row] valueForKey:kCountryName];
        cell.detailTextLabel.text = [[self.filteredCountries objectAtIndex:indexPath.row] valueForKey:kCountryCallingCode];
        NSString *imagePath = [NSString stringWithFormat:@"CountryPicker.bundle/%@", [[self.filteredCountries objectAtIndex:indexPath.row] valueForKey:kCountryCode]];
        UIImage *image;
        if ([[UIImage class] respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)])
            image = [UIImage imageNamed:imagePath inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        else
            image = [UIImage imageNamed:imagePath];
        cell.imageView.image = image;

    }else{
        cell.textLabel.text = [[_dataRows objectAtIndex:indexPath.row] valueForKey:kCountryName];
        cell.detailTextLabel.text = [[_dataRows objectAtIndex:indexPath.row] valueForKey:kCountryCallingCode];
        NSString *imagePath = [NSString stringWithFormat:@"CountryPicker.bundle/%@", [[_dataRows objectAtIndex:indexPath.row] valueForKey:kCountryCode]];
        UIImage *image;
        if ([[UIImage class] respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)])
            image = [UIImage imageNamed:imagePath inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        else
            image = [UIImage imageNamed:imagePath];
        cell.imageView.image = image;

    }
    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return[NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    
    NSInteger newRow = [self indexForFirstChar:title inArray:countriesArray];
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:newRow inSection:0];
    [tableView scrollToRowAtIndexPath:newIndexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    
    return index;
}

// Return the index for the location of the first item in an array that begins with a certain character
- (NSInteger)indexForFirstChar:(NSString *)character inArray:(NSArray *)array
{
    NSUInteger count = 0;
    for (NSString *str in array) {
        if ([str hasPrefix:character]) {
            return count;
        }
        count++;
    }
    return 0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(didSelectCountry:)]) {
        [self.delegate didSelectCountry:(self.isFiltered) ?[self.filteredCountries objectAtIndex:[_tableView indexPathForSelectedRow].row]:[_dataRows objectAtIndex:[_tableView indexPathForSelectedRow].row]];
        [self dismissViewControllerAnimated:YES completion:NULL];
    } else {
        NSLog(@"CountryListView Delegate : didSelectCountry not implemented");
    }
}

#pragma mark -
#pragma mark Actions


@end
