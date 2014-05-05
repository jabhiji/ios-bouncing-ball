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
@synthesize ball1;
@synthesize ball2;
@synthesize blackView;
@synthesize ballView1;
@synthesize ballView2;
@synthesize timer;

// ball is drawn at a random location on screen (based on the model)
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ball1 = [UIImage imageNamed:@"yellowBall.png"];
    ball2 = [UIImage imageNamed:@"whiteBall.png"];
    model = [[Model alloc] init];

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
    // remove earlier image
    [ballView1 removeFromSuperview];
    [ballView2 removeFromSuperview];
 
    // update ball position
    [model updateBallPositions];
    
    // draw the ball at the new location
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
    
    ballView1 = [[UIImageView alloc]
                initWithFrame:CGRectMake(x1-R, y1-R, 2*R, 2*R)];
    ballView1.image = ball1;
    [self.blackView addSubview:ballView1];

    ballView2 = [[UIImageView alloc]
                initWithFrame:CGRectMake(x2-R, y2-R, 2*R, 2*R)];
    ballView2.image = ball2;
    [self.blackView addSubview:ballView2];

}

@end