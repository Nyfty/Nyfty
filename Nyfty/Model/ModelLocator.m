//
//  ModelLocator.m
//  8Re
//
//  Created by Salman Nasir on 08/02/2013.
//  Copyright (c) 2013 Salman Nasir. All rights reserved.
//

#import "ModelLocator.h"

@implementation ModelLocator

@synthesize LiveUrl;


static ModelLocator *instance = nil;

+(ModelLocator*) getInstance{
    @synchronized([ModelLocator class])
	{
		if (!instance)
		instance = [[self alloc] init];
		return instance;
	}
    
	return nil;
}

+(id)alloc
{
	@synchronized([ModelLocator class])
	{
		NSAssert(instance == nil, @"Attempted to allocate a second instance of a singleton.");
		instance = [super alloc];
		return instance;
	}
	return nil;
}

-(id)init {
	self = [super init];
	if (self != nil) {
        
    

//        LiveUrl = @"http://192.168.1.20/gravel/gravel-api/";
//        LiveUrl = @"http://52.34.155.230/";

    }
	return self;
}

-(void)sayHello {
	NSLog(@"Hello World!");
}

@end
