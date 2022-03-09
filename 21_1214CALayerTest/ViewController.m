//
//  ViewController.m
//  21_1214CALayerTest
//
//  Created by 陈新爽 on 2021/12/14.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBezierPath];
    [self createSpecial];
    [self createRound];
    [self createGradientColor1];
    [self createGradientColor2];

}

#pragma mark - method
- (void)createBezierPath {
    //1. 三次贝塞尔曲线
        UIBezierPath *path = [[UIBezierPath alloc] init];
        [path moveToPoint:CGPointMake(100, 100)];
        [path addCurveToPoint:CGPointMake(300, 100) controlPoint1:CGPointMake(150, 0) controlPoint2:CGPointMake(250, 200)];
        CAShapeLayer *shapeLayer = [[CAShapeLayer alloc]init];
        [self.view.layer addSublayer:shapeLayer];
        shapeLayer.path = path.CGPath;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
        shapeLayer.lineWidth = 5;
}

- (void)createSpecial {
    //    2. 特殊形状
        CGSize finalSize = CGSizeMake(CGRectGetWidth(self.view.frame), 600);
        CGFloat layerHeight = finalSize.height * 0.2;
        CAShapeLayer *bottomCurveLayer = [[CAShapeLayer alloc]init];
    
        UIBezierPath *path = [[UIBezierPath alloc]init];
        [path moveToPoint:CGPointMake(0, finalSize.height - layerHeight)];
        [path addLineToPoint:CGPointMake(0, finalSize.height - 1)];
        [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - 1)];
        [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - layerHeight)];
        [path addQuadCurveToPoint:CGPointMake(0, finalSize.height - layerHeight) controlPoint:CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight) - 40)];
        bottomCurveLayer.path = path.CGPath;
        bottomCurveLayer.fillColor = [UIColor orangeColor].CGColor;
        [self.view.layer addSublayer:bottomCurveLayer];
}

- (void)createRound {
    //3. 圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 50, 50)];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];
}

//- (void)createTextArea {
//    //4. CATextLayer
//    CATextLayer *textLayer = [CATextLayer layer];
//    textLayer.frame = CGRectMake(100, 100, 200, 80);
//    [self.view.layer addSublayer:textLayer];
//
//    //设置文本内容
//    textLayer.string = @"子曰：君子食无求饱，居无求安，敏於事而慎於言，就有道而正焉，可谓好学也已。";
//
//    //设置背景颜色
//    textLayer.backgroundColor = [UIColor blackColor].CGColor;
//
//    //设置字体颜色 默认是白色
//    textLayer.foregroundColor = [UIColor whiteColor].CGColor;
//
//    //设置字体 需要将UIFont类型转换成为CGFontRef类型
//    UIFont *font = [UIFont systemFontOfSize:15];
//    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
//    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
//    textLayer.font = fontRef;
//    textLayer.fontSize = font.pointSize;//字体大小需要使用fontSize来进行单独设置，因为CGFontRef类型并不像UIFont一样包含大小
//    CGFontRelease(fontRef);
//
//    //设置字体对齐方式
//    textLayer.alignmentMode = kCAAlignmentJustified;
//    textLayer.wrapped = YES;
//
//    //设置文字分辨率
//    textLayer.contentsScale = [UIScreen mainScreen].scale;
//}

- (void)createGradientColor1 {
    //    //2种渐变色
        CAGradientLayer *layer = [CAGradientLayer layer];
        layer.frame = CGRectMake(100, 300, 300, 50);
        [self.view.layer addSublayer:layer];
    
        layer.colors = @[
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor,
                         ];
        layer.startPoint = CGPointMake(0, 0.5);//以单位坐标系进行定义
        layer.endPoint = CGPointMake(1.0, 0.5);
}

- (void)createGradientColor2 {
    //    //2种渐变色
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(100, 400, 300, 50);
    [self.view.layer addSublayer:layer];

    layer.colors = @[
                     (__bridge id)[UIColor redColor].CGColor,
                     (__bridge id)[UIColor blueColor].CGColor,
                     (__bridge id)[UIColor greenColor].CGColor,
                     ];

    layer.locations = @[
                        @(0),
                        @(0.4),
                        @(0.7),
                        ];

    layer.startPoint = CGPointMake(0, 0.5);//以单位坐标系进行定义
    layer.endPoint = CGPointMake(1.0, 0.5);
}
@end
