//
//  Model.m
//  iOS-Ball
//
//  Created by Abhijit Joshi on 5/3/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import "Model.h"

@implementation Model

@synthesize x1, y1;
@synthesize x2, y2;
@synthesize R;
@synthesize speedX1, speedY1;
@synthesize speedX2, speedY2;
@synthesize WIDTH;
@synthesize HEIGHT;

// Override superclass implementation of init

- (id) init {

    self = [super init];
    
    if (self) {
        
        WIDTH = 280.0;
        HEIGHT = 340.0;
        
        R = 15.0;
        x1 = R + arc4random()%(int)(WIDTH/2 - 2*R);
        y1 = R + arc4random()%(int)(HEIGHT/2 - 2*R);
        x2 = WIDTH/2 + R + arc4random()%(int)(WIDTH/2 - 2*R);
        y2 = HEIGHT/2 + R + arc4random()%(int)(HEIGHT/2 - 2*R);
        
        speedX1 = 0.2;
        speedY1 = 0.2;
        speedX2 = 2.0;
        speedY2 = 2.0;
    }
    
    return self;
}

// move the ball based on the current speed
// and also check for wall collisions

- (void) updateBallPositions
{
    // change ball coordinates in the model
    x1 += speedX1;
    y1 += speedY1;
    x2 += speedX2;
    y2 += speedY2;
    
    // check for collisions with walls
    if (x1 > WIDTH - R) {
        x1 = WIDTH - R - 1;
        speedX1 = -fabsf(speedX1);
    }
    if (y1 > HEIGHT - R) {
        y1 = HEIGHT - R - 1;
        speedY1 = -fabsf(speedY1);
    }
    if (x1 < R) {
        x1 = R + 1;
        speedX1 = fabsf(speedX1);
    }
    if (y1 < R) {
        y1 = R + 1;
        speedY1 = fabsf(speedY1);
    }

    if (x2 > WIDTH - R) {
        x2 = WIDTH - R - 1;
        speedX2 = -fabsf(speedX2);
    }
    if (y2 > HEIGHT - R) {
        y2 = HEIGHT - R - 1;
        speedY2 = -fabsf(speedY2);
    }
    if (x2 < R) {
        x2 = R + 1;
        speedX2 = fabsf(speedX2);
    }
    if (y2 < R) {
        y2 = R + 1;
        speedY2 = fabsf(speedY2);
    }
    
    // check collisions with each other
    float distance = sqrtf((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1));
    if (distance < 2*R) {
        float temp = speedX1;
        speedX1 = speedX2;
        speedX2 = temp;
        temp = speedY1;
        speedY1 = speedY2;
        speedY2 = temp;
    }
}

@end