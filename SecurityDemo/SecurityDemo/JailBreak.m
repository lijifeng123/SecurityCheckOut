//
//  JailBreak.m
//  SecurityDemo
//
//  Created by 李继峰 on 2018/3/20.
//  Copyright © 2018年 xxx. All rights reserved.
//

#import "JailBreak.h"
#import "AppDelegate.h"

#define ARRAY_SIZE(a) sizeof(a)/sizeof(a[0])
const char* jailbreak_tool_pathes[] = {
    "/Applications/Cydia.app",
    "/Library/MobileSubstrate/MobileSubstrate.dylib",
    "/bin/bash",
    "/usr/sbin/sshd",
    "/etc/apt"
};


@implementation JailBreak


+ (BOOL)isJailBreak{
    
    if ([JailBreak isJailBreakOne] || [JailBreak isJailBreakTwo] || [JailBreak isJailBreakThree] || [JailBreak isJailBreakFour]) {
        return YES;
    }
    
    return NO;
}

+ (void)exitApplicationWhenJailBreak{
    
    if ([JailBreak isJailBreakOne] || [JailBreak isJailBreakTwo] || [JailBreak isJailBreakThree] || [JailBreak isJailBreakFour]) {
        
        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"本应用暂不支持在越狱设备上运行，请使用未越狱设备进行重新安装" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [JailBreak exitWithAnimation];
        }];
        [alertVc addAction:sureAction];
        
        [app.window.rootViewController presentViewController:alertVc animated:YES completion:nil];
        
    }
    
}


+ (void)exitWithAnimation{
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIWindow *window = app.window;
    
    [UIView animateWithDuration:.35 animations:^{
        window.alpha = 0;
        window.frame = CGRectMake(window.frame.size.width/2, window.frame.size.height/2, 0, 0);
    } completion:^(BOOL finished) {
        exit(0);
    }];
}

+ (BOOL)isJailBreakOne
{
    for (int i=0; i<ARRAY_SIZE(jailbreak_tool_pathes); i++) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:jailbreak_tool_pathes[i]]]) {
            NSLog(@"The device is jail broken!");
            return YES;
        }
    }
    NSLog(@"The device is NOT jail broken!");
    return NO;
}

+ (BOOL)isJailBreakTwo
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]) {
        NSLog(@"The device is jail broken!");
        return YES;
    }
    NSLog(@"The device is NOT jail broken!");
    return NO;
}


#define USER_APP_PATH  @"/User/Applications/"
+ (BOOL)isJailBreakThree
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:USER_APP_PATH]) {
        NSLog(@"The device is jail broken!");
        NSArray *applist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:USER_APP_PATH error:nil];
        NSLog(@"applist = %@", applist);
        return YES;
    }
    NSLog(@"The device is NOT jail broken!");
    return NO;
}

char* printEnv(void)
{
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    NSLog(@"%s", env);
    return env;
}

+ (BOOL)isJailBreakFour
{
    if (printEnv()) {
        NSLog(@"The device is jail broken!");
        return YES;
    }
    NSLog(@"The device is NOT jail broken!");
    return NO;
}



@end
