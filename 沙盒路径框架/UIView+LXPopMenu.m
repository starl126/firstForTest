//
//  UIView+LXPopMenu.m
//  LXWeibo
//
//  Created by starxin on 15/10/12.
//  Copyright (c) 2015年 starxin. All rights reserved.
//

#import "UIView+LXPopMenu.h"

@implementation UIView (LXPopMenu)

UIWindow *_window;

void (^_dismiss)();
+ (void)popMenuBelow:(UIView *)belowView contentSize:(CGSize)inSize originY:(CGFloat)y contentView:(UIView *)contentView marginTop:(CGFloat)top marginLeft:(CGFloat)left dismiss:(void (^)())dismiss
{
    [self popMenuBelowRect:belowView.frame inView:belowView contentSize:inSize originY:y contentView:contentView marginTop:top marginLeft:left dismiss:dismiss];
    
}

+ (void)popMenuBelowRect:(CGRect)belowRect inView:(UIView *)inView contentSize:(CGSize)inSize originY:(CGFloat)y contentView:(UIView *)contentView marginTop:(CGFloat)top marginLeft:(CGFloat)left dismiss:(void (^)())dismiss
{
    _dismiss = dismiss;
    
    //0.设置window
    _window = [[UIWindow alloc] initWithFrame:SCREEN_BOUNDS];
    _window.hidden = NO;
    _window.windowLevel = MAXFLOAT;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelTitleBtnClick:)];
    [_window addGestureRecognizer:tap];
    
    //1.设置下拉菜单的背景
    UIImageView *bgImage = [[UIImageView alloc] init];
    bgImage.userInteractionEnabled = YES;
    CGRect convertRect = [inView.superview convertRect:belowRect toView:_window];
    CGFloat bgX = convertRect.origin.x + 0.5 * (convertRect.size.width - inSize.width);
    CGFloat bgY = CGRectGetMaxY(convertRect) + y;
    
    bgImage.frame = CGRectMake(bgX, bgY, inSize.width, inSize.height);
    bgImage.image = image(@"popover_background");
    [_window addSubview:bgImage];
    
    //2.设置下拉菜单内容
    contentView.frame = CGRectMake(left, top, bgImage.width - 2 * left, bgImage.height - 2 * top);
    
    [bgImage addSubview:contentView];
    
}
UIViewController *_contentVc;
+ (void)popMenuBelowRect:(CGRect)belowRect inView:(UIView *)inView contentSize:(CGSize)inSize originY:(CGFloat)y contentVc:(UIViewController *)contentVc marginTop:(CGFloat)top marginLeft:(CGFloat)left dismiss:(void (^)())dismiss
{
    _contentVc = contentVc;
    
    [self popMenuBelowRect:belowRect inView:inView contentSize:inSize originY:y contentView:contentVc.view marginTop:top marginLeft:left dismiss:dismiss];
}
+ (void)cancelTitleBtnClick:(UITapGestureRecognizer *)tap
{
    CGPoint point = [tap locationInView:_window.superview];
    CGPoint convertPoint = [_window.subviews.firstObject convertPoint:point fromView:_window.superview];
    //0.如果tap点击的点属于背景图片，则不进行任何处理
    if ([[_window.subviews.firstObject layer] containsPoint:convertPoint]) {
        return ;
    }
    _window = nil;
    //1.block回调
    if (_dismiss != nil) {
        _dismiss();
    }
    NSLog(@"cancelTitleBtnClick");
}
@end
