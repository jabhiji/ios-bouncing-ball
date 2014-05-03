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

    // remove earlier image
    [ballView removeFromSuperview];
    
    // draw the new image
    model.x = model.R + arc4random()%(int)(280-2*model.R);
    model.y = model.R + arc4random()%(int)(280-2*model.R);
    float x = model.x;
    float y = model.y;
    float R = model.R;
    
    ballView = [[UIImageView alloc]
                             initWithFrame:CGRectMake(x-R, y-R, 2*R, 2*R)];
    ballView.image = ball;
    [self.blackView addSubview:ballView];
}

@end