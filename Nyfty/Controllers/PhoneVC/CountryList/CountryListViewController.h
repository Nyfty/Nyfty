//
//  CountryListViewController.h
//  Country List
//
//  Created by Pradyumna Doddala on 18/12/13.
//  Copyright (c) 2013 Pradyumna Doddala. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CountryListViewDelegate <NSObject>
- (void)didSelectCountry:(NSDictionary *)country;
@end

@interface CountryListViewController : UIViewController
{
    NSMutableArray *countriesArray;
}
@property (nonatomic, strong) NSMutableArray *filteredCountries;

@property (nonatomic, assign) id<CountryListViewDelegate>delegate;
@property (nonatomic) BOOL isFiltered;
- (id)initWithNibName:(NSString *)nibNameOrNil delegate:(id)delegate;
@end
