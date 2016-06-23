//
//  AutoScrollView.h
//  AuToScrollView
//
//  Created by Peter on 6/22/16.
//  Copyright © 2016 Peter. All rights reserved.
//

/*
 Peter's special ATTENTION:
 
 1.USE xib to construct VIEW,NO other layout setting,it antomatically adapts to superview. (prefered)
 2.USE pure code to construct View ,you need to arrange subbview's frame in method ** -(void)layoutSubviews **
 
*/


#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, PHAutoScrollViewOrientation) {
    PHAutoScrollHorizon = 1 ,
    PHAutoScrollVertical,
};



@interface AutoScrollView : UIScrollView

@property(nonatomic,strong)NSArray *viewArray;
@property(nonatomic,assign)PHAutoScrollViewOrientation oritentaion;

+(instancetype)autoScrollViewWithFrame:(CGRect)frame withStyle:(PHAutoScrollViewOrientation)oritentaion andSubViewArray:(NSArray *)viewarray;

@end
