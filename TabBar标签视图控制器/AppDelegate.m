//
//  AppDelegate.m
//  TabBar标签视图控制器
//
//  Created by lanouhn on 15/7/1.
//  Copyright (c) 2015年 main.m. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    /*
     1. 导航试图控制器和标签试图控制器的区别
     （1.0）导航控制器，管理的控制器之间存在层级关系（依赖关系）
     （1.1）标签控制器， 管理的控制器之间存在并列关系（同时存在，互不干扰）
     2.0 管理方式
     导航视图控制器以栈的形式管理多个试图控制器，push 入栈， POP出栈，当返回上一届面时，空间收回
     标签视图，以不可变数组管理，而且创建时必须要全部制定上所管理的多个试图控制器，而且多个试图控制器同时存在，空间不会回收
     3.0 视图之间的嵌套
     正常用法：标签视图控制器管理多个导航控制器，每个导航控制器又管理多个单试图控制器。（每个界面都会有导航条，而且都是不同的，单试图控制器可以自定义导航内容）
     非正常用法：导航控制器管理标签控制器，标签控制器用来管理多个单试图控制器。（每个界面都会有导航条， 但是导航条都是一样的，单试图控制器不可以自定义导航条的内容）这种非正常方式不符合逻辑，基本上不这么用
     4.0 导航控制器 标签控制器  都是多视图控制器，可以管理多个视图控制器， 但是UITableViewController，UIViewController是单试图控制器，不可以管理试图控制器，只能管理视图
     */
    
    FirstViewController *firstVC = [[FirstViewController alloc]init];
    //设置一个导航条控制器
    UINavigationController *firstNV = [[UINavigationController alloc]initWithRootViewController:firstVC];
    
    
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
    
    FourthViewController *fourthVC = [[FourthViewController alloc]init];
    
    FifthViewController *fifthVC = [[FifthViewController alloc]init];
    
    SixthViewController *sixthVC = [[SixthViewController alloc]init];
    
    //给控制器设置title
    firstNV.tabBarItem.title = @"firstNV";
    secondVC.tabBarItem.title = @"secondVC";
    thirdVC.tabBarItem.title = @"thirdVC";
    fourthVC.tabBarItem.title = @"fourthVC";
    fifthVC.tabBarItem.title = @"fifthVC";
    sixthVC.tabBarItem.title = @"sixthVC";
    
    //给控制器设置图标
    firstNV.tabBarItem.image = [UIImage imageNamed:@"Chat_GroupList_Btn_Click.tiff"];
    secondVC.tabBarItem.image = [UIImage imageNamed:@"icon_0_128x128.png"];
    thirdVC.tabBarItem.image = [UIImage imageNamed:@"f289b8cf95b1dd247dc8b43ce63113.png"];
    fourthVC.tabBarItem.image = [UIImage imageNamed:@"HeadShow101.tiff"];
    fifthVC.tabBarItem.image = [UIImage imageNamed:@"SendFile_Icon_Click.tiff"];
    sixthVC.tabBarItem.image = [UIImage imageNamed:@"Expression_30.tiff"];
    
    NSArray *controllers = @[firstNV , secondVC , thirdVC , fourthVC , fifthVC , sixthVC];
    
    UITabBarController *tabarVCS = [[UITabBarController alloc]init];
    tabarVCS.viewControllers = controllers;
    
    self.window.rootViewController = tabarVCS;
    
    [firstVC release];
    [secondVC release];
    [thirdVC release];
    [fourthVC release];
    [fifthVC release];
    [sixthVC release];
    [firstNV release];
    
    
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
