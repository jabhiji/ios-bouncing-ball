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
@synthesize WIDTH;
@synthesize HEIGHT;

// Override superclass implementation of init

- (id) init {

    self = [super init];
    
    if (self) {
        
        WIDTH = 280.0;
        HEIGHT = 340.0;
        
        R = 20.0;
        x = R + arc4random()%(int)(280 - 2*R);
        y = R + arc4random()%(int)(280 - 2*R);
        
        speedX = 1.0;
        speedY = 1.0;
    }
    
    return self;
}

// move the ball based on the current speed
// and also check for wall collisions

- (void) updateBallPosition
{
    // change ball coordinates in the model
    x += speedX;
    y += speedY;
    
    // check for collisions with walls
    if (x > WIDTH-R || x < R) {
        speedX = -speedX;
    }
    if (y > HEIGHT-R || y < R) {
        speedY = -speedY;
    }
}

@end