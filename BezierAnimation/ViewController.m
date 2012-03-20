//
//  ViewController.m
//  BezierAnimation
//
//  Created by openthread on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    _curveView = [[CurveView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [_curveView setNeedsDisplay];
    [self.view addSubview:_curveView];
}

@end