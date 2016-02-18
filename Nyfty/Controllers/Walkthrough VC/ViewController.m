//
//  ViewController.m
//  Nyfty
//
//  Created by Atif Mehmood on 16/02/2016.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "RegistrationViewController.h"
@interface ViewController ()
{
    CGRect frame;
    UIImageView *imgView;
    NSMutableArray *images;
}
@end

@implementation ViewController

@synthesize next,getStarted,logIn,scrollView,skipBtn,pageControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPageControlDesign];
    [self setUpWalkThroughDesign];
}

-(void)setPageControlDesign
{
    pageControl.numberOfPages = 4;
    [pageControl sizeToFit];
    [self.view addSubview:pageControl];
    
    SMPageControl *appearance = [SMPageControl appearance];
    appearance.indicatorDiameter = 3.0f;
    appearance.indicatorMargin = 2.0f;
    appearance.pageIndicatorImage = [UIImage imageNamed:@"InactivePage"];
    appearance.currentPageIndicatorImage = [UIImage imageNamed:@"currentPage"];
}

-(void)setUpWalkThroughDesign
{
    
    
    
    next.hidden = true;
    skipBtn.hidden = true;
    self.automaticallyAdjustsScrollViewInsets=NO;
    images = [[NSMutableArray alloc]initWithObjects: [UIImage imageNamed:@"belltower-welcome-main"],[UIImage imageNamed:@"belltower-welcome-intro"],[UIImage imageNamed:@"scroll_imae2"],[UIImage imageNamed:@"scroll_imae3"],[UIImage imageNamed:@"scroll_imae4"], nil];
    
    int numberofViews = (int)[images count];
    
    for (int i = 0; i < numberofViews; i++)
    {
        
        frame.origin.x = [[[UIApplication sharedApplication]delegate]window].frame.size.width * i ;
        frame.origin.y = 0;
        frame.size = [[[UIApplication sharedApplication]delegate]window].frame.size;
        imgView = [[UIImageView alloc] init];
        imgView.frame = frame;
        imgView.image = [images objectAtIndex:i];
        [imgView setUserInteractionEnabled:YES];
        scrollView.pagingEnabled = YES;
        
        if (i == 0) {
            
            [self setSingleLabelInScroll:@"Your Favorite stores delivered anytime, anywhere."];
            [self setLogoImageOnScrollView];
            
        }else if (i == 1) {
            
            [self setLogoImageOnScrollView];
            [self setSingleLabelInScroll:@"Your Favorite stores delivered anytime, anywhere."];
            
        }else if(i == 2) {
            
            [self setlabelsInScroll:@"We're all about local" andSecond:@"We offer speedy delivery from any store you can think of in Chapel Hill & Carborro, just name it and we'll deliver." andLines:3];
            
        }else if (i == 3){
            
            [self setlabelsInScroll:@"Explore by storefront" andSecond:@"We setup storefronts for the most popular locations to make it easy for you to shop, but if you cant't find what you're looking for simply search for or enter it manually." andLines:4];

        }else{
            
            [self setlabelsInScroll:@"Order and we'll do the rest" andSecond:@"Once you've nailed down what you want, put your order in flight and one of our drivers will purchase then deliver it right to your door! Simple. Easy. Fun." andLines:4];
            
        }
        
        [scrollView addSubview:imgView];
        
    }
    [self.view bringSubviewToFront:skipBtn];

}

-(void)setLogoImageOnScrollView
{
    float width = 334;
    float height = 93;
    if (IS_IPHONE_5) {
        width = 250;
        height = 51;
    }
    UIImageView *logoImage = [[UIImageView alloc] init];
    logoImage.frame = CGRectMake(20, 100, width, height);
    [logoImage setCenter:CGPointMake(self.view.frame.size.width / 2, 160)];
    logoImage.image = [UIImage imageNamed:@"nyfty-welcome-logo"];
    [imgView addSubview:logoImage];
    [self.view bringSubviewToFront:logoImage];
}

-(void)setSingleLabelInScroll:(NSString *)text
{
    float y= [[[UIApplication sharedApplication]delegate] window].frame.size.height - 280;
    UILabel *label;
    if (IS_IPHONE_5) {
        y = [[[UIApplication sharedApplication]delegate] window].frame.size.height - 220;
        label  = [[UILabel alloc] initWithFrame:CGRectMake(([[[UIApplication sharedApplication]delegate] window].frame.size.width - 250)/2,y, 280, 38)];

    }else{
        
        label  = [[UILabel alloc] initWithFrame:CGRectMake(([[[UIApplication sharedApplication]delegate] window].frame.size.width - 330)/2,y, 350, 38)];
    }
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Raleway-Regular" size:[ApplicationHelper returnFontSizeWithDynamicSize:24.3]];
    [label setNumberOfLines:2];
    [label sizeToFit];
    [label setCenter:CGPointMake(self.view.frame.size.width / 2, y)];
    [imgView addSubview:label];
}

-(void)setlabelsInScroll:(NSString *)firstLabelText andSecond:(NSString *)secondLabelText andLines:(int)lines
{
    float y = [[[UIApplication sharedApplication]delegate] window].frame.size.height - 265;
  
    if (IS_IPHONE_5) {
        
    }
    UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(([[[UIApplication sharedApplication]delegate] window].frame.size.width - 232)/2,y, 310, 38)];
    label.text = firstLabelText;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Raleway-Medium" size:[ApplicationHelper returnFontSizeWithDynamicSize:24.3]];
    label.textAlignment = NSTextAlignmentCenter;
    [label setNumberOfLines:0];
    [label sizeToFit];
    [label setCenter:CGPointMake(self.view.frame.size.width / 2, y)];

    [imgView addSubview:label];
    
    UILabel *labelSecond  = [[UILabel alloc] initWithFrame:CGRectMake(([[[UIApplication sharedApplication]delegate] window].frame.size.width - 280)/2,[[[UIApplication sharedApplication]delegate] window].frame.size.height - 245, 285, 38)];
    labelSecond.text = secondLabelText;
    labelSecond.textColor = [UIColor colorWithRed:171.0/255.0 green:212.0/255.0 blue:236.0/255.0 alpha:1.0];
    labelSecond.font = [UIFont fontWithName:@"Raleway-Medium" size:14];
    labelSecond.textAlignment = NSTextAlignmentCenter;
    [labelSecond setNumberOfLines:lines];
    [labelSecond sizeToFit];
    [imgView addSubview:labelSecond];
}


-(void) viewDidLayoutSubviews
{
    [scrollView setContentSize:CGSizeMake([[[UIApplication sharedApplication]delegate]window].frame.size.width * images.count,[[[UIApplication sharedApplication]delegate]window].frame.size.height - 57)];

}


- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    if( [scrollView isDragging])
    {
        CGFloat pageWidth = scrollView.frame.size.width;
        int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        if (page > 0) {
            page = page -1;
            pageControl.currentPage = page;
        }
        
    }
    if (page == 0) {
        next.hidden = true;
        skipBtn.hidden = true;
        [getStarted setBackgroundColor:[UIColor colorWithRed:88.0/255.0 green:170.0/255.0 blue:218.0/255.0 alpha:1.0]];
        [logIn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [logIn setBackgroundColor:[UIColor colorWithRed:20.0/255.0 green:38.0/255.0 blue:49.0/255.0 alpha:1.0]];

    }else if (page == 1) {
        next.hidden = false;
        skipBtn.hidden = false;
    }else if (page == 3) {
        next.hidden = false;
        skipBtn.hidden = false;
    }else if (page == 4){
        next.hidden = true;
        skipBtn.hidden = true;
        [logIn setBackgroundColor:[UIColor whiteColor]];
        [logIn setTitleColor:[UIColor colorWithRed:88.0/255.0 green:170.0/255.0 blue:218.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [getStarted setBackgroundColor:[UIColor colorWithRed:20.0/255.0 green:38.0/255.0 blue:49.0/255.0 alpha:1.0]];
    }
}

-(IBAction)nextBtnAction:(id)sender
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
    page = page+1;
    [scrollView setContentOffset:CGPointMake(pageWidth * page, 0) animated:YES];

}

-(IBAction)skipBtnAction:(id)sender
{
    pageControl.currentPage = 4;
    CGFloat pageWidth = scrollView.frame.size.width;
    [scrollView setContentOffset:CGPointMake(pageWidth * 4, 0) animated:YES];
}

-(IBAction)logInBtnAction:(id)sender
{
    LoginViewController *push = [[UIStoryboard storyboardWithName:@"Atif" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:push animated:true];
    
}

-(IBAction)getStartedBtnAction:(id)sender
{
    RegistrationViewController *push = [[UIStoryboard storyboardWithName:@"Atif" bundle:NULL]instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    [self.navigationController pushViewController:push animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
