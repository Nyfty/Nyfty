//
//  CustomButtonFont.m
//  Gravel
//
//  Created by Toqeer Ahmad on 1/13/16.
//  Copyright © 2016 RAC Application. All rights reserved.
//

#import "CustomButtonFont.h"

@implementation CustomButtonFont

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)awakeFromNib
{
    self.titleLabel.font = [UIFont fontWithName:self.titleLabel.font.familyName size:[UIScreen mainScreen].bounds.size.width/414 * self.titleLabel.font.pointSize];
}

@end
