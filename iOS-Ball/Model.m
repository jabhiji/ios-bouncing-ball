//
//  Model.m
//  iOS-Ball
//
//  Created by Abhijit Joshi on 5/3/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import "Model.h"

@implementation Model
@synthesize ballRect = _ballRect;

- (id) init {
    
    self = [super init];
    if (self) {
    
        // the yellow ball
        UIImage *ballImage = [UIImage imageNamed:@"yellowBall.png"];
        CGSize ballSize = [ballImage size];
        ballSize.width = 2*BALL_RADIUS;
        ballSize.height = 2*BALL_RADIUS;
        ballRect = CGRectMake(100, 100, ballSize.width, ballSize.height);

    }
    
    return self;
}

@end