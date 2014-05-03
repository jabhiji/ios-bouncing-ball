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


// Override superclass implementation of init so that we can provide a properly
// initialized game model

- (id) init {

    self = [super init];
    
    if (self) {
        x = 100.0;
        y = 200.0;
        R = 20.0;
    }
    
    return self;
}


@end