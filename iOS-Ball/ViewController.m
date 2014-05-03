//
//  ViewController.m
//  iOS-Ball
//
//  Created by Abhijit Joshi on 5/3/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self drawBall];
}


- (void) drawBall
{
    ball = [UIImage imageNamed:@"yellowBall.png"];
    
    model = [[Model alloc] init];
    float x = model.x;
    float y = model.y;
    UIImageView *ballView = [[UIImageView alloc] initWithFrame:CGRectMake(x-20, y-20, 40, 40)];
    ballView.image = ball;
    [self.view addSubview:ballView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
