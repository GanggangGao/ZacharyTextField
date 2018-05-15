//
//  UIView+NSStringImage.h
//  CusAnimationTestField
//
//  Created by zachary spark on 2018/3/15.
//  Copyright © 2018年 Struggle3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIView(NSStringImage)
CGImageRef sCreateImage(CGPoint offset, BOOL opaque, CGSize size, CGFloat scale, void (^callback)(CGContextRef));

//String 画图
UIImage *sMakeImage(CGSize size, BOOL opaque, CGFloat scale, void (^callback)(CGContextRef));
@end
