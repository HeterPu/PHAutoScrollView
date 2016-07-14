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

/**
 *  滚动视图的方向
 */
typedef NS_ENUM(NSUInteger, PHAutoScrollViewOrientation) {
    /**
     *  水平滚动
     */
    PHAutoScrollHorizon = 1,
    /**
     *  垂直滚动
     */
    PHAutoScrollVertical,
};


@interface AutoScrollView : UIScrollView


/**
 *  装有视图(VIEW)的数组
 */
@property(nonatomic,strong)NSArray *viewArray;
/**
 *  滚动视图的方向
 */
@property(nonatomic,assign)PHAutoScrollViewOrientation oritentaion;

/**
 *  获取滚动视图的实例对象
 *
 *  @param frame       滚动视图的尺寸
 *  @param oritentaion 滚动视图的方向
 *  @param viewarray   滚动视图数组
 *
 *  @return 实例对象
 */
+(instancetype)autoScrollViewWithFrame:(CGRect)frame
                             withStyle:(PHAutoScrollViewOrientation)oritentaion
                       andSubViewArray:(NSArray *)viewarray;
@end
