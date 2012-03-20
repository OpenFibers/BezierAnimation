//
//  CurvePoint.m
//  CurveTest
//
//  Created by openthread on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CurvePoint.h"

@implementation CurvePoint

@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (touches.count != 1)
    {
        return;
    }
    UITouch *touch = touches.anyObject;
    CGPoint touchLocation = [touch locationInView:self.window];
    CGPoint previousTouchLocation = [touch previousLocationInView:self.window];
    CGFloat horizontalMoved = touchLocation.x - previousTouchLocation.x;
    CGFloat verticalMoved = touchLocation.y - previousTouchLocation.y;
    
    CGPoint currentCenter = self.center;
    currentCenter.x += horizontalMoved;
    currentCenter.y += verticalMoved;
    self.center = currentCenter;
    
    if (_delegate && [_delegate respondsToSelector:@selector(pointMoved)])
    {
        [_delegate pointMoved];
    }
}

@end
