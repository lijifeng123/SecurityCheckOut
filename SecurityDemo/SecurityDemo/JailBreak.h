//
//  JailBreak.h
//  SecurityDemo
//
//  Created by 李继峰 on 2018/3/20.
//  Copyright © 2018年 xxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JailBreak : NSObject

/**判断是否越狱*/
+ (BOOL)isJailBreak;
/**越狱提示退出*/
+ (void)exitApplicationWhenJailBreak;
@end
