//
//  XLRatingBar.h
//  XLRatingBar
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLRatingBar : UIView
/**
 *  最大星星数量,默认5
 */
@property (nonatomic, assign) int maxStar;
/**
 *  当前显示的星星,最少选择一星
 */
@property (nonatomic, assign) int currentStar;
/**
 *  星星之间的间隔,默认2.0
 */
@property (nonatomic, assign) CGFloat starPadding;
/**
 *  是否可以点击
 */
@property (nonatomic, assign, getter=isEnable) BOOL enable;


@end
