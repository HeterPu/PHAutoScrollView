//
//  ViewController.m
//  AuToScrollView
//
//  Created by Peter on 6/22/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import "ViewController.h"
#import "PHPageControl.h"
#import "AutoScrollView.h"

#import "CubeView.h"
#import "SumCubeView.h"


#define color(r,g,b,a)   [UIColor colorWithRed: ( r / 255.0) green:( g / 255.0) blue:( b / 255.0) alpha:( a / 1.0)]

@interface ViewController ()<UIScrollViewDelegate,PHControldotClickDelegate>

@property (nonatomic,weak)PHPageControl * pagecontrol;
@property (nonatomic,strong)NSArray *viewArray;

@property(nonatomic,assign)int i;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *arra = [NSMutableArray array];
    
    //view 1
        CubeView * cube = [CubeView instanceCubeView];
        [cube setTitle:@"" andImageName:@"ME_wenda"];
        cube.backgroundColor = color(20 , 244, 135, 1.0);
        [arra addObject:cube];
    //view 2
        UIView *view1 = [[UIView alloc] init];
        view1.backgroundColor = [UIColor redColor];
        [arra addObject:view1];
    //view 3
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor blueColor];
    [arra addObject:view2];
    //view4
    SumCubeView *view3 = [[SumCubeView alloc] init];
    view3.backgroundColor = [UIColor purpleColor];
//    [view3 setCubeView];
    [arra addObject:view3];
    
    _viewArray = arra;
    
    AutoScrollView *autoview = [AutoScrollView autoScrollViewWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, self.view.frame.size.width - 20) withStyle:PHAutoScrollHorizon andSubViewArray:_viewArray];
//    autoview.backgroundColor = [UIColor redColor];
//    autoview.pagingEnabled = YES;
    
    [self.view addSubview:autoview];
    autoview.delegate = self;
    
//    [self.view addSubview:view3];
    
    PHPageControl * pagecontro = [[PHPageControl alloc] init];
    pagecontro.center = CGPointMake(self.view.frame.size.width / 2 + 100, 290);
    pagecontro.bounds = CGRectMake(0, 0, 20, 400);
//   PHPageControl * pagecontro = [PHPageControl pHpageControlwithFrame:CGRectMake(60, 100, 300, 20) customStyleWithSelectedImage:@"selected" defaultImage:@"default"];
//    pagecontro.center = CGPointMake(self.view.frame.size.width / 2, 430);
//    pagecontro.bounds = CGRectMake(0, 0, 30, 200);
    pagecontro.controlOrientation = PHPageControlOrientationVertical;
    pagecontro.buttonBackgroundColor  = [UIColor grayColor];
    pagecontro.selectedColor = [UIColor yellowColor];
    pagecontro.cornerradius = 10;
    pagecontro.widthDivideHeight = 0.5;
    pagecontro.isDotCanClick = YES;
//    pagecontro.dotPadding = 40;
    [pagecontro setScaleAnimation:YES withScaleFactor:1.2];
    pagecontro.numberOfPages = arra.count;
    pagecontro.selectedPage = 0;
    
    pagecontro.delegate = self;
//
    _pagecontrol = pagecontro;
   
    _i = 0;
    
    
    [self.view addSubview:pagecontro];

    // Do any additional setup after loading the view, typically from a nib.
}


-(void)didSelectedButtonIndex:(NSInteger)index {
    
    NSLog(@"ggggg%li",index);
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 2.求出页码
    double pageDouble = offsetX / scrollView.frame.size.width;
    int pageInt = (int)(pageDouble + 0.5);
    self.pagecontrol.selectedPage = pageInt;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
