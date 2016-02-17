//
//  ViewController.h
//  Nyfty
//
//  Created by Atif Mehmood on 16/02/2016.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMPageControl.h"
@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIButton *getStarted;
@property (nonatomic, weak) IBOutlet UIButton *logIn;
@property (nonatomic, weak) IBOutlet UIButton *next;
@property (nonatomic, weak) IBOutlet UIButton *skipBtn;
@property (nonatomic, weak) IBOutlet SMPageControl *pageControl;

@end

