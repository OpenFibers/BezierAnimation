//
//  CurveView.m
//  CurveTest
//
//  Created by openthread on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CurveView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CurveView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        int const pointWidth = 33;
        _point1 = [[CurvePoint alloc] initWithFrame:CGRectMake(110, 277, pointWidth, pointWidth)];
        _point2 = [[CurvePoint alloc] initWithFrame:CGRectMake(190, 277, pointWidth, pointWidth)];
        _controlPoint1 = [[CurvePoint alloc] initWithFrame:CGRectMake(233, 132, pointWidth, pointWidth)];
        _controlPoint2 = [[CurvePoint alloc] initWithFrame:CGRectMake(64, 132, pointWidth, pointWidth)];
        _view = [[UIView alloc] initWithFrame:CGRectMake(200, 200, pointWidth, pointWidth)];
        
        _point1.backgroundColor = [UIColor blackColor];
        _point2.backgroundColor = [UIColor blackColor];
        _controlPoint1.backgroundColor = [UIColor redColor];
        _controlPoint2.backgroundColor = [UIColor redColor];
        _view.backgroundColor = [UIColor blueColor];
        
        _point1.delegate = self;
        _point2.delegate = self;
        _controlPoint1.delegate = self;
        _controlPoint2.delegate = self;
        
        UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [control addTarget:self action:@selector(animation) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:control];
        
        [self addSubview:_point1];
        [self addSubview:_point2];
        [self addSubview:_controlPoint1];
        [self addSubview:_controlPoint2];
    }
    return self;
}

- (void)pointMoved
{
    [self setNeedsDisplay];
}

- (void)animation
{
    _view.frame = _point1.frame;
    [self addSubview:_view];
    
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animation]; 
    animation.duration=2.0f; 
    animation.path=_path; 
    animation.rotationMode=kCAAnimationRotateAuto;
    animation.delegate = self;
    [_view.layer addAnimation:animation forKey:@"position"];
}

- (void)animationDidStart:(CAAnimation *)anim
{
    _view.frame = _point2.frame;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [_view removeFromSuperview];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGPoint point1 = _point1.center;
    CGPoint point2 = _point2.center;
    CGPoint controlPoint1 = _controlPoint1.center;
    CGPoint controlPoint2 = _controlPoint2.center;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};  
    CGColorRef color = CGColorCreate(colorSpace, components);  
    CGContextSetStrokeColorWithColor(context, color);
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, point1.x, point1.y);
    CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, point2.x, point2.y);
    CGContextAddPath(context, path);
    
    if (_path)
    {
        CGPathRelease(_path);
    }
    _path = CGPathCreateCopy(path);
    
    CGPathRelease(path);
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorSpace);
    CGColorRelease(color);
}

@end
