//
//  CurvePoint.h
//  CurveTest
//
//  Created by openthread on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CurvePointDelegate <NSObject>

@optional
- (void)pointMoved;

@end


@interface CurvePoint : UIView
{
    __unsafe_unretained NSObject<CurvePointDelegate> *_delegate;
}

@property (nonatomic,assign) NSObject<CurvePointDelegate> *delegate;

@end
