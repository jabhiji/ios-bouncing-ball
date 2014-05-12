//
//  ViewController.m
//  iOS-Ball
//
//  Created by Abhijit Joshi on 5/3/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize model;
@synthesize yellowBall, whiteBall;
@synthesize blackView;
@synthesize timer;

// ball is drawn at a random location on screen (based on the model)
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // initialize ball UIViews
    CGRect viewRect = CGRectMake(100, 100, 40, 40);
    
    yellowBall = [[Ball1 alloc] initWithFrame:viewRect];
    [yellowBall setBackgroundColor:[UIColor clearColor]];
    
    whiteBall = [[Ball2 alloc] initWithFrame:viewRect];
    [whiteBall setBackgroundColor:[UIColor clearColor]];

    // instantiate model variables
    model = [[Model alloc] init];
    model.WIDTH  = self.blackView.frame.size.width;
    model.HEIGHT = self.blackView.frame.size.height;
    [model setInitialBallPositions];

    // display initial condition before animation starts
    [self showBalls];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// pressing the START button begins the animation
- (IBAction)startTimer:(id)sender {
    
    // remove previously active instances (if any)
    [timer invalidate];
    timer = nil;
    
    // create a new timer based loop
    timer = [NSTimer timerWithTimeInterval:1.0/60.0
                                     target:self
                                   selector:@selector(update)
                                   userInfo:nil
                                    repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

// pressing the STOP button stops the animation
- (IBAction)stopTimer:(id)sender {
    [timer invalidate];
    timer = nil;
}

// update model parameters and plot the ball using the view
- (void) update
{
    // update ball position
    [model updateBallPositions];
    
    // draw the balls at the new location
    [self showBalls];
}

// draw the balls in the defined view
- (void) showBalls
{
    float x1 = model.x1;
    float y1 = model.y1;
    float x2 = model.x2;
    float y2 = model.y2;
    float R = model.R;
    
    yellowBall.frame = CGRectMake(x1-R, y1-R, 2*R, 2*R);
    [self.blackView addSubview:yellowBall];

    whiteBall.frame = CGRectMake(x2-R, y2-R, 2*R, 2*R);
    [self.blackView addSubview:whiteBall];
}

@end