//
//  Model.h
//  iOS-Ball
//
//  Created by Abhijit Joshi on 5/3/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject {
    
    float x;  // ball center x-coordinate
    float y;  // ball center y-coordinate
    float R;  // ball radius
}

@property float x;
@property float y;
@property float R;

@end