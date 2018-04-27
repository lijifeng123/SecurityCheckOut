//
//  main.m
//  SecurityDemo
//
//  Created by 李继峰 on 2018/3/20.
//  Copyright © 2018年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <dlfcn.h>
#import "AppDelegate.h"

//定义一个函数指针用来接收动态加载出来的函数ptrace
typedef int (*ptrace_ptr_t)(int _request, pid_t _pid, caddr_t _addr, int _data);

#if !defined(PT_DENY_ATTACH)
#define PT_DENY_ATTACH 31
#endif

void DenyAppAttach() {
    
    //动态加载并链接指定的库
    //第一个参数path为0时, 它会自动查找 $LD_LIBRARY_PATH,$DYLD_LIBRARY_PATH, $DYLD_FALLBACK_LIBRARY_PATH 和 当前工作目录中的动态链接库.
    void * handle = dlopen(0, RTLD_GLOBAL | RTLD_NOW);
    
    //动态加载ptrace函数，ptrace函数的参数个数和类型，及返回类型跟ptrace_ptr_t函数指针定义的是一样的
    ptrace_ptr_t ptrace_ptr = dlsym(handle, "ptrace");
    
    //执行ptrace_ptr相当于执行ptrace函数
    ptrace_ptr(PT_DENY_ATTACH, 0, 0, 0);
    
    //关闭动态库，并且卸载
    dlclose(handle);
}

int main(int argc, char * argv[]) {

#ifndef DEBUG
    DenyAppAttach();
#endif
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


