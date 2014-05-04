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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ball = [UIImage imageNamed:@"yellowBall.png"];
    model = [[Model alloc] init];

    [self drawBall];
}


- (void) drawBall
{
    float x = model.x;
    float y = model.y;
    float R = model.R;
    ballView = [[UIImageView alloc]
                initWithFrame:CGRectMake(x-R, y-R, 2*R, 2*R)];
    ballView.image = ball;
    [self.blackView addSubview:ballView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moveToRandomLocation:(id)sender {

    timer = nil;
    timer = [NSTimer timerWithTimeInterval:1.0/60.0
                                    target:self
                                  selector:@selector(update)
                                  userInfo:nil
                                   repeats:YES];

    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
}

- (IBAction)stopTimer:(id)sender {
    [timer invalidate];
    timer = nil;
}

- (void) update
{
    if (timer != nil) {
        
    // remove earlier image from the view
    [ballView removeFromSuperview];
    
    // change ball coordinates in the model
    model.x += model.speedX;
    model.y += model.speedY;
    
    // check for collisions with walls
    if (model.x > 280-model.R || model.x < model.R) {
        model.speedX = -model.speedX;
    }
    if (model.y > 280-model.R || model.y < model.R) {
        model.speedY = -model.speedY;
    }
    
    // draw the ball at the new location in the view
    [self showBall];
        
    }
}
                      
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