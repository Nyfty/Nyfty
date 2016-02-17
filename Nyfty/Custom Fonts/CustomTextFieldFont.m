//
//  CustomTextFieldFont.m
//  Gravel
//
//  Created by Toqeer Ahmad on 1/20/16.
//  Copyright © 2016 RAC Application. All rights reserved.
//

#import "CustomTextFieldFont.h"

@implementation CustomTextFieldFont

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)awakeFromNib
{
    self.font = [UIFont fontWithName:self.font.familyName size:[UIScreen mainScreen].bounds.size.width/414 * self.font.pointSize];
}

@end
