//
//  Model.h
//  iOS-Ball
//
//  Created by Abhijit Joshi on 5/3/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property float x;
@property float y;
@property float R;

@property float speedX;
@property float speedY;

@property float WIDTH;
@property float HEIGHT;

- (void) updateBallPosition;

@end