//
//  ViewController.m
//  HoverButton
//
//  Created by 荣学敏 on 2018/3/28.
//  Copyright © 2018年 李云祥. All rights reserved.
//

#import "ViewController.h"
#import "SuspensionAssistiveTouch.h"
#import "NextViewController.h"
#import "NextViewController.h"
@interface ViewController ()<HoverBtnDelegate>
{
    SuspensionAssistiveTouch * _assistiveTouch;
}

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _assistiveTouch.alpha = 1;
    });
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"首页";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 100, 100, 40);
    [button setTitle:@"界面跳转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(jumpToNext) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];

    
    //延迟2秒展示按钮
    [self performSelector:@selector(setAssistiveTouch) withObject:nil afterDelay:3];
}


#pragma mark - AssistiveTouch
-(void)releseAssistiveTouch
{
    
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    if (windows.count > 1) {
        
        SuspensionAssistiveTouch *touchView = [windows lastObject];
        [touchView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        touchView = nil;
    }
}
#pragma mark - AssistiveTouch
- (void)setAssistiveTouch
{
    _assistiveTouch = [[SuspensionAssistiveTouch alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 50, [UIScreen mainScreen].bounds.size.height-155, 40, 40)];
    _assistiveTouch.delegate = self;
    
}
-(void)HoverBtnClick:(NSInteger)index
{
    NSLog(@"点击了按钮");
//    [self releseAssistiveTouch];
//    _assistiveTouch.alpha = 0;
}
#pragma mark -跳转到下一个界面
- (void)jumpToNext
{
    NextViewController *next = [[NextViewController alloc]init];
    [self.navigationController pushViewController:next animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    _assistiveTouch.alpha = 0;
}
@end
