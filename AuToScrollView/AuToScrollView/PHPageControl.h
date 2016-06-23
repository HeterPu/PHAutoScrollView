//
//  PHPageControl.h
//  AuToScrollView
//
//  Created by Peter on 6/22/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, PHPageControlOrientation) {
    PHPageControlOrientationHorizon = 1 ,
    PHPageControlOrientationVertical,
};

typedef NS_ENUM(NSUInteger, PHPageControlStyle) {
    PHPageControlStyleSquare = 1,
    PHPageControlSyleCustom,
};


@protocol PHControldotClickDelegate <NSObject>

-(void)didSelectedButtonIndex:(NSInteger)index;

@end


@interface PHPageControl : UIView


@property(nonatomic,assign)PHPageControlOrientation controlOrientation;
@property (nonatomic,weak) id<PHControldotClickDelegate> delegate;

@property(nonatomic,assign)NSInteger numberOfPages;
//
@property(nonatomic,assign)NSInteger selectedPage;
//
@property(nonatomic,assign)NSInteger dotPadding;
//
@property(nonatomic,assign)PHPageControlStyle  controlStyle;
@property(nonatomic,assign)BOOL isDotCanClick;
//
//// FOR SQUARE;

@property(nonatomic,strong)UIColor *selectedColor;

@property(nonatomic,assign)CGFloat cornerradius;

@property(nonatomic,weak)UIColor *buttonBackgroundColor;

@property(nonatomic,assign)CGFloat widthDivideHeight;



+(instancetype)pHpageControlwithFrame:(CGRect)frame customStyleWithSelectedImage:(NSString *)selectedimage defaultImage:(NSString *)defaultimage;

-(void)setScaleAnimation:(BOOL)isscaled withScaleFactor:(CGFloat)factor;

@end



