//
//  CurveView.h
//  CurveTest
//
//  Created by openthread on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurvePoint.h"

@interface CurveView : UIView <CurvePointDelegate>
{
    CurvePoint *_point1;
    CurvePoint *_point2;
    CurvePoint *_controlPoint1;
    CurvePoint *_controlPoint2;
    
    UIView  *_view;
    
    CGPathRef _path;
}

@end
