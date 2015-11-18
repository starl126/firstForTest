//
//  UIView+LXPopMenu.h
//  LXWeibo
//
//  Created by starxin on 15/10/12.
//  Copyright (c) 2015年 starxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LXPopMenu)

/**
 *  设置下拉菜单
 *
 *  @param belowView 下拉菜单在belowView的下面
 *  @param inSize    下拉菜单的内容大小
 *  @param y         下拉菜单距离belowView下面Y值的大小
 *  @param contentView 下拉菜单的内容控件
 *  @param dismiss   点击蒙板后传递给调用者的block
 */
+ (void)popMenuBelow:(UIView *)belowView contentSize:(CGSize)inSize originY:(CGFloat)y contentView:(UIView *)contentView marginTop:(CGFloat)top marginLeft:(CGFloat)left dismiss:(void (^)())dismiss;
/**
 *  设置下拉菜单
 *
 *  @param belowRect 下拉菜单在belowView的下面
 *  @param inView    belowRect描述的控件
 *  @param inSize    下拉菜单的内容大小
 *  @param y         下拉菜单距离belowView下面Y值的大小
 *  @param contentView 下拉菜单的内容控件
 *  @param dismiss   点击蒙板后传递给调用者的block
 */
+ (void)popMenuBelowRect:(CGRect)belowRect inView:(UIView *)inView contentSize:(CGSize)inSize originY:(CGFloat)y contentView:(UIView *)contentView marginTop:(CGFloat)top marginLeft:(CGFloat)left dismiss:(void (^)())dismiss;

/**
 *  设置下拉菜单
 *
 *  @param belowRect 下拉菜单在belowView的下面
 *  @param inView    belowRect描述的控件
 *  @param inSize    下拉菜单的内容大小
 *  @param y         下拉菜单距离belowView下面Y值的大小
 *  @param contentVc 下拉菜单的内容控制器
 *  @param dismiss   点击蒙板后传递给调用者的block
 */
+ (void)popMenuBelowRect:(CGRect)belowRect inView:(UIView *)inView contentSize:(CGSize)inSize originY:(CGFloat)y contentVc:(UIViewController *)contentVc marginTop:(CGFloat)top marginLeft:(CGFloat)left dismiss:(void (^)())dismiss;


@end
