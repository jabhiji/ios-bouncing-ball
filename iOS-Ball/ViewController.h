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
#import "Ball1.h"
#import "Ball2.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) Model* model;
@property (nonatomic, strong) Ball1* yellowBall;
@property (nonatomic, strong) Ball2* whiteBall;
@property (nonatomic, strong) IBOutlet View *blackView;
@property (nonatomic, strong) UIImageView* ballView1;
@property (nonatomic, strong) UIImageView* ballView2;
@property (nonatomic, strong) NSTimer* timer;

- (IBAction)startTimer:(id)sender;
- (IBAction)stopTimer:(id)sender;
- (void) update;

@end