//
//  PHPageControl.m
//  AuToScrollView
//
//  Created by Peter on 6/22/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import "PHPageControl.h"

#define  KSCREEN_SIZE self.frame.size


@interface PHPageControl()

@property(nonatomic,copy)NSString *selsectedImage;
@property(nonatomic,copy)NSString *defaultImage;

@property(nonatomic,weak)UIButton *selectedButton;
@property(nonatomic,assign)BOOL isScaled;
@property(nonatomic,assign)CGFloat scaleFactor;
@property(nonatomic,assign)CGFloat dotWidth;
@property(nonatomic,assign)CGFloat dotHeight;



@end

@implementation PHPageControl


+(instancetype)pHpageControlwithFrame:(CGRect)frame customStyleWithSelectedImage:(NSString *)selectedimage defaultImage:(NSString *)defaultimage {
    
    PHPageControl *control = [[PHPageControl alloc] initWithFrame:frame];
    control.selsectedImage = selectedimage;
    control.defaultImage = defaultimage;
    control.controlStyle = PHPageControlSyleCustom;
    return control;
}


-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

#pragma mark - settingwork

-(void)setNumberOfPages:(NSInteger)numberOfPages {
    _numberOfPages = numberOfPages;
    
//    self.backgroundColor = [UIColor redColor];
    
    if (self.controlOrientation == PHPageControlOrientationHorizon) {
        for (int i =0; i < numberOfPages; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = i + 1;
            CGFloat xvalue = KSCREEN_SIZE.width / 2  - (self.dotWidth + self.dotPadding) / 2 * (numberOfPages - 1 - 2 * i);
            CGFloat yvalue = KSCREEN_SIZE.height / 2;
            button.bounds = CGRectMake(0, 0,self.dotWidth, KSCREEN_SIZE.height);
            button.center = CGPointMake(xvalue,yvalue);
            if (self.isDotCanClick == YES) {
                [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
            }
            if (self.controlStyle == PHPageControlStyleSquare) {
                button.backgroundColor = self.buttonBackgroundColor;
                button.layer.cornerRadius = self.cornerradius;
            }
            else
            {
                [button setImage:[UIImage imageNamed:_defaultImage] forState:UIControlStateNormal];
                [button setImage:[UIImage imageNamed:_defaultImage] forState:UIControlStateHighlighted];
            }
            [self addSubview:button];
         }
       }
    else
    {
        for (int i =0; i < numberOfPages; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = i + 1;
            CGFloat yvalue = KSCREEN_SIZE.height / 2  - (self.dotHeight + self.dotPadding) / 2 * (numberOfPages - 1 - 2 * i);
            CGFloat xvalue = KSCREEN_SIZE.width / 2;
            button.bounds = CGRectMake(0, 0,KSCREEN_SIZE.width, self.dotHeight);
            button.center = CGPointMake(xvalue,yvalue);
            if (self.isDotCanClick == YES) {
                [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
            }
            if (self.controlStyle == PHPageControlStyleSquare) {
                button.backgroundColor = self.buttonBackgroundColor;
                button.layer.cornerRadius = self.cornerradius;
            }
            else
            {
                [button setImage:[UIImage imageNamed:_defaultImage] forState:UIControlStateNormal];
                [button setImage:[UIImage imageNamed:_defaultImage] forState:UIControlStateHighlighted];
            }
            [self addSubview:button];
    }
  }
}


-(void)buttonClick:(UIButton *)sender {
    NSLog(@"blablablablal");
    if ([self.delegate respondsToSelector:@selector(didSelectedButtonIndex:)]) {
        [self.delegate didSelectedButtonIndex:(sender.tag - 1)];
        self.selectedPage = (sender.tag - 1);
    }
}


-(void)setSelectedPage:(NSInteger)selectedPage {
    
    if (_selectedButton) {
        
        if (self.controlStyle == PHPageControlStyleSquare) {
            _selectedButton.backgroundColor = self.buttonBackgroundColor ;
        }
        else
        {
        [_selectedButton setImage:[UIImage imageNamed:_defaultImage] forState:UIControlStateNormal];
        [_selectedButton setImage:[UIImage imageNamed:_defaultImage] forState:UIControlStateHighlighted];
        }
        if (self.isScaled == YES) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationDelegate:self];
        _selectedButton.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(0),1, 1);
        [UIView commitAnimations];
        }
    }
    _selectedPage = selectedPage;
    
    UIButton *selectedbutton = [self viewWithTag:(selectedPage + 1)];
    
    if (self.controlStyle == PHPageControlStyleSquare) {
        
        selectedbutton.backgroundColor = self.selectedColor;
    }
    else
    {
    [selectedbutton setImage:[UIImage imageNamed:_selsectedImage] forState:UIControlStateNormal];
    [selectedbutton setImage:[UIImage imageNamed:_selsectedImage] forState:UIControlStateHighlighted];
        
    }
    if (self.isScaled == YES) {
        
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    selectedbutton.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(0), self.scaleFactor, self.scaleFactor);
    [UIView commitAnimations];
    }
    _selectedButton = selectedbutton;
}


-(NSInteger)dotPadding {
    if (!_dotPadding) {
        if (self.controlOrientation == PHPageControlOrientationHorizon) {
            _dotPadding = self.frame.size.height;
        }
        else
        {
          _dotPadding = self.frame.size.width;
        }
    }
    return _dotPadding;
}


-(PHPageControlStyle)controlStyle {
    
    if (!_controlStyle) {
        _controlStyle = PHPageControlStyleSquare;
    }
    return _controlStyle;
}



-(UIColor *)buttonBackgroundColor {
    
    if (!_buttonBackgroundColor) {
        _buttonBackgroundColor = [UIColor grayColor];
    }
    return _buttonBackgroundColor;
}



-(UIColor *)selectedColor {
    
    if (!_selectedColor) {
        _selectedColor = [UIColor redColor];
    }
    return _selectedColor;
}


-(CGFloat)cornerradius {
    if (!_cornerradius) {
        _cornerradius = 0.0;
    }
    return _cornerradius;
}

-(BOOL)isIsScaled {
    if (!_isScaled) {
        _isScaled = NO;
    }
    return _isScaled;
}


-(CGFloat)dotWidth {
    
    if (!_widthDivideHeight) {
        _dotWidth = KSCREEN_SIZE.height;
        return _dotWidth;
    }
    else
    {
        _dotWidth = KSCREEN_SIZE.height * _widthDivideHeight;
        return _dotWidth;
    }
}


-(CGFloat)dotHeight {
    
    if (!_widthDivideHeight) {
        _dotHeight = KSCREEN_SIZE.width;
        return _dotHeight;
    }
    else
    {
        _dotHeight = KSCREEN_SIZE.width / _widthDivideHeight;
        return _dotHeight;
    }
}



-(BOOL)isDotCanClick {
    if (!_isDotCanClick) {
        _isDotCanClick = NO;
    }
    return _isDotCanClick;
}


-(PHPageControlOrientation)controlOrientation {
    if (!_controlOrientation) {
        _controlOrientation = PHPageControlOrientationHorizon;
    }
    return _controlOrientation;
}


-(void)setScaleAnimation:(BOOL)isscaled withScaleFactor:(CGFloat)factor {
    _isScaled = isscaled;
    _scaleFactor = factor;
}

-(CGFloat)scaleFactor {
    
    if (_scaleFactor) {
        if (_scaleFactor<1.0||_scaleFactor>1.4) {
            _scaleFactor = 1.2;
        }
        return _scaleFactor;
    }
    else
    {
        _scaleFactor = 1.2;
        return _scaleFactor;
    }
}


@end
