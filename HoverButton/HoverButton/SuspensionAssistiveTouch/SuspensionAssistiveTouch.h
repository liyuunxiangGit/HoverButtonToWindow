//
//  SuspensionAssistiveTouch.h
//  SuspensionAssistiveTouch
//
//  Created by Rainy on 2017/9/20.
//  Copyright © 2017年 Rainy. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Header.h"


@protocol HoverBtnDelegate <NSObject>//协议

- (void)HoverBtnClick:(NSInteger)index;//协议方法

@end



@interface SuspensionAssistiveTouch : UIWindow



- (instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic, assign) id<HoverBtnDelegate>delegate;//代理属性

@end
