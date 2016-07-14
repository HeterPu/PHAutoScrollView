//
//  AutoScrollView.m
//  AuToScrollView
//
//  Created by Peter on 6/22/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import "AutoScrollView.h"


@interface AutoScrollView()
@end

@implementation AutoScrollView

+(instancetype)autoScrollViewWithFrame:(CGRect)frame
                             withStyle:(PHAutoScrollViewOrientation)oritentaion
                        andSubViewArray:(NSArray *)viewarray {
    
    AutoScrollView *autoview = [[AutoScrollView alloc]initWithFrame:frame];
    autoview.oritentaion = oritentaion;
    autoview.viewArray = viewarray;
    return autoview;
}


-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


-(void)setViewArray:(NSArray *)viewArray {
    _viewArray = viewArray;
    if (self.oritentaion == PHAutoScrollHorizon) {
        
        CGFloat viewwidth = self.frame.size.width;
        CGFloat viewheight = self.frame.size.height;
        self.contentSize = CGSizeMake(viewwidth * _viewArray.count, 0);
        
        if (_viewArray.count != 0) {
            for (int i = 0; i < _viewArray.count; i++) {
                UIView *subview = _viewArray[i];
                subview.tag = 10 + i;
                subview.frame = CGRectMake(viewwidth * i, 0, viewwidth, viewheight);
                [self addSubview:subview];
            }
        }
    }
    else
    {
        CGFloat viewwidth = self.frame.size.width;
        CGFloat viewheight = self.frame.size.width;
        self.contentSize = CGSizeMake(0, viewwidth * _viewArray.count);
        
        if (_viewArray.count != 0) {
            for (int i = 0; i < _viewArray.count; i++) {
                UIView *subview = _viewArray[i];
                subview.tag = 10 + i;
                subview.frame = CGRectMake(0, viewheight * i, viewwidth, viewheight);
                [self addSubview:subview];
            }
        }
    }
}


-(PHAutoScrollViewOrientation)oritentaion {
    if (!_oritentaion) {
        _oritentaion = PHAutoScrollHorizon;
    }
    return _oritentaion;
}


@end
