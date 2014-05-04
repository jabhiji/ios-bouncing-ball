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
@synthesize ball;
@synthesize blackView;
@synthesize ballView;
@synthesize timer;

// ball is drawn at a random location on screen (based on the model)
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ball = [UIImage imageNamed:@"yellowBall.png"];
    model = [[Model alloc] init];

    [self showBall];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// pressing the START button begins the animation
- (IBAction)moveToRandomLocation:(id)sender {

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
    // remove earlier image
    [ballView removeFromSuperview];
 
    // update ball position
    [model updateBallPosition];
    
    // draw the ball at the new location
    [self showBall];
}

// draw the ball in the defined view
- (void) showBall
{
    float x = model.x;
    float y = model.y;
    float R = model.R;
    
    ballView = [[UIImageView alloc]
                initWithFrame:CGRectMake(x-R, y-R, 2*R, 2*R)];
    ballView.image = ball;
    [self.blackView addSubview:ballView];
}

@end