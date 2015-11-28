//
//  TheIodineView.m
//  shapeFrame
//
//  Created by ouzhenxuan on 15/11/27.
//  Copyright © 2015年 ouzhenxuan. All rights reserved.
//

#import "TheIodineView.h"

@implementation TheIodineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)drawRect:(CGRect)rect{
    
    
    

    UIImage * myImage = [UIImage imageNamed:@"hehe"];

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 3);
    CGContextSaveGState(ctx);//保存上下文
    
    
    //设置剪裁范围：
    CGContextAddRect(ctx, CGRectMake(11.5, 11.5, 100,27));
//    CGContextClip(ctx);
    CGContextAddRect(ctx, CGContextGetClipBoundingBox(ctx));
    CGContextEOClip(ctx);
    
//  画两个圆
    CGContextAddEllipseInRect(ctx,CGRectMake(0, 11.5, 27, 27));//因为只要确定了矩形框，圆或者是椭圆就确定了。
    CGContextAddEllipseInRect(ctx,CGRectMake(100, 0, 50, 50));//因为只要确定了矩形框，圆或者是椭圆就确定了。
    CGContextStrokePath(ctx);
    
    CGContextRestoreGState(ctx);//恢复状态后，就不会受裁剪的影响，不然只能在剪裁
    CGContextSaveGState(ctx);//保存上下文
//  设置剪裁范围：
    CGContextAddRect(ctx, CGRectMake(0, 0, 11.5,50));
//    CGContextAddEllipseInRect(ctx,CGRectMake(0, 11.5, 27, 27));//因为只要确定了矩形框，圆或者是椭圆就确定了。
    CGContextAddEllipseInRect(ctx,CGRectMake(100, 0, 50, 50));//因为只要确定了矩形框，圆或者是椭圆就确定了。
//    CGContextClip(ctx);
    CGContextAddRect(ctx, CGContextGetClipBoundingBox(ctx));
    CGContextEOClip(ctx);
    
//     画矩形
    CGContextAddRect(ctx, CGRectMake(10, 11.5, 100,27));
    CGContextStrokePath(ctx);
    
    CGContextRestoreGState(ctx);//恢复状态后，就不会受裁剪的影响，不然只能在剪裁
//    加图片
    CGContextAddEllipseInRect(ctx,CGRectMake(105, 5, 40, 40));//因为只要确定了矩形框，圆或者是椭圆就确定了。
    CGContextClip(ctx);
    
    CGContextTranslateCTM(ctx, 0, 50);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextDrawImage(ctx, CGRectMake(100, 0, 50, 50), [myImage CGImage]);

    CGContextStrokePath(ctx);
    

}


//线
- (void) drawline{
    //    CGContextRef cen =UIGraphicsGetCurrentContext();
    //
    //    //2.绘制原点
    //    CGContextMoveToPoint(cen, 104, 11.5);
    //    //3.开始画图
    //    CGContextAddLineToPoint(cen, 20, 11.5);
    //    CGContextStrokePath(cen);//这是是图形空心
    //
    //
    //    [self drawArc];
    //    [self drawSmailArc];
}

//大圆
- (void) drawArc{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctx, 125, 25, 25, 153/180.0 *M_PI,207/180.0 * M_PI, 1);
    
    CGContextStrokePath(ctx);
    
}



//小圆
- (void)drawSmailArc{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctx, 150-25-21-90, 25, 13.5, M_PI_2,3* M_PI_2, 0);
    
    CGContextStrokePath(ctx);
    
}

@end
