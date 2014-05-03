//
//  Model.h
//  iOS-Ball
//
//  Created by Abhijit Joshi on 5/3/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View.h"

#define BALL_RADIUS 20.0

@interface Model : NSObject {
    CGRect ballRect;
}

@property (readonly) CGRect ballRect;

@end
