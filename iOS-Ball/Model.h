//
//  Model.h
//  iOS-Ball
//
//  Created by Abhijit Joshi on 5/3/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property float x1;
@property float x2;
@property float y1;
@property float y2;
@property float R;

@property float speedX1;
@property float speedY1;
@property float speedX2;
@property float speedY2;

@property float WIDTH;
@property float HEIGHT;

- (void) setInitialBallPositions;
- (void) updateBallPositions;

@end