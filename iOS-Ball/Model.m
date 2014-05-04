//
//  Model.m
//  iOS-Ball
//
//  Created by Abhijit Joshi on 5/3/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import "Model.h"

@implementation Model

@synthesize x;
@synthesize y;
@synthesize R;
@synthesize speedX;
@synthesize speedY;

// Override superclass implementation of init so that we can provide a properly
// initialized game model

- (id) init {

    self = [super init];
    
    if (self) {
        R = 20.0;
        x = R + arc4random()%(int)(280 - 2*R);
        y = R + arc4random()%(int)(280 - 2*R);
        
        speedX = 1.0;
        speedY = 1.0;
    }
    
    return self;
}


@end