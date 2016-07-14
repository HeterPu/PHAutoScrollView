//
//  PHPageControl.h
//  AuToScrollView
//
//  Created by Peter on 6/22/16.
//  Copyright © 2016 Peter. All rights reserved.
//
/*
 attention:
 方法调用顺序;
 1.  
 SQUARE:PHPageControl * pagecontrol = [[PHPageControl alloc] init];
 CUSTOM:PHPageControl * pagecontrol = [PHPageControl pHpageControlwithFrame:CGRectMake(60, 100, 300, 20) customStyleWithSelectedImage:@"selected" defaultImage:@"default"];
 2.
 pagecontrol.controlOrientation = PHPageControlOrientationVertical;
 pagecontrol.buttonBackgroundColor  = [UIColor grayColor];
 pagecontrol.selectedColor = [UIColor yellowColor];
 pagecontrol.cornerradius = 10;
 pagecontrol.widthDivideHeight = 0.5;
 pagecontrol.isDotCanClick = YES;
 pagecontrol.dotPadding = 40;
 [pagecontrol setScaleAnimation:YES withScaleFactor:1.2];
pagecontrol.delegate = self;
 3.
  pagecontrol.numberOfPages = arra.count;
 4.
  pagecontrol.selectedPage = 0;
 */

#import <UIKit/UIKit.h>

/**
 *  PageControl的滚动方向
 */
typedef NS_ENUM(NSUInteger, PHPageControlOrientation) {
    /**
     *  水平方向
     */
    PHPageControlOrientationHorizon = 1,
    /**
     *  垂直方向
     */
    PHPageControlOrientationVertical,
};

/**
 *  PageControl的类型
 */
typedef NS_ENUM(NSUInteger, PHPageControlStyle) {
    /**
     *  矩形类型
     */
    PHPageControlStyleSquare = 1,
    /**
     *  自定义图片类型
     */
    PHPageControlSyleCustom,
};

/**
 *  选中按钮点击代理
 */
@protocol PHControldotClickDelegate <NSObject>
-(void)didSelectedButtonIndex:(NSInteger)index;
@end


@interface PHPageControl : UIView
/**
 *  控件的方向
 */
@property(nonatomic,assign)PHPageControlOrientation controlOrientation;
@property (nonatomic,weak) id<PHControldotClickDelegate> delegate;
/**
 *  分页的数量
 */
@property(nonatomic,assign)NSInteger numberOfPages;
/**
 *  选择的页码
 */
@property(nonatomic,assign)NSInteger selectedPage;
/**
 *  点的间隔
 */
@property(nonatomic,assign)NSInteger dotPadding;
/**
 *  控件的类型（方形或自定义）
 */
@property(nonatomic,assign)PHPageControlStyle  controlStyle;
/**
 *  是否控件页码可以点击
 */
@property(nonatomic,assign)BOOL isDotCanClick;

//// FOR SQUARE style;

/**
 *  选择矩形按钮的颜色
 */
@property(nonatomic,strong)UIColor *selectedColor;
/**
 *  选择矩形按钮的边框弧度
 */
@property(nonatomic,assign)CGFloat cornerradius;
/**
 *  未选择矩形按钮的颜色
 */
@property(nonatomic,weak)UIColor *buttonBackgroundColor;
/**
 *  选择矩形按钮的宽高比（width / height）
 */
@property(nonatomic,assign)CGFloat widthDivideHeight;


//// FOR CUSTOM style

/**
 *  获得自定义类型实例
 *
 *  @param frame         设置尺寸
 *  @param selectedimage 选择的图片
 *  @param defaultimage  默认的图片（未选择的图片）
 *
 *  @return 实例对象
 */
+(instancetype)pHpageControlwithFrame:(CGRect)frame customStyleWithSelectedImage:(NSString *)selectedimage defaultImage:(NSString *)defaultimage;

/**
 *  设置点击按钮的放大因子
 *
 *  @param isscaled 是否放大
 *  @param factor   放大因子
 */
-(void)setScaleAnimation:(BOOL)isscaled withScaleFactor:(CGFloat)factor;

@end



