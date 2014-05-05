//
//  ViewController.h
//  iOS-Ball
//
//  Created by Abhijit Joshi on 5/3/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

// Controller talks with the Model and the View

#import "Model.h"
#import "View.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) Model* model;
@property (nonatomic, strong) UIImage* ball;
@property (nonatomic, strong) IBOutlet View *blackView;
@property (nonatomic, strong) UIImageView* ballView;
@property (nonatomic, strong) NSTimer* timer;

- (IBAction)startTimer:(id)sender;
- (IBAction)stopTimer:(id)sender;
- (void) update;

@end