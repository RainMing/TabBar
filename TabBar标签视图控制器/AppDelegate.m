//
//  AppDelegate.m
//  TabBar标签视图控制器
//
//  Created by lanouhn on 15/7/1.
//  Copyright (c) 2015年 main.m. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

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
    
    //准备一个数组，用来存放控制器
    NSArray *controllers = @[firstNV , secondVC , thirdVC , fourthVC , fifthVC , sixthVC];
    //创建一个标签试图控制器
    UITabBarController *tabarVCS = [[UITabBarController alloc]init];
   //给创建的标签试图控制器指定已经准备好的单试图控制器数组 controllers
    tabarVCS.viewControllers = controllers;
    
    
    
    //************标签视图控制器的属性*******
    //设置标签视图控制器中单试图控制器的渲染颜色
    tabarVCS.tabBar.tintColor = [UIColor magentaColor];
    //设置标签试图控制器自身的颜色
//    tabarVCS.tabBar.backgroundColor = [UIColor greenColor];
//    tabarVCS.tabBar.barTintColor = [UIColor greenColor];//两者的效果不同
    //设置标签试图控制器，默认选中的控制器
//    tabarVCS.selectedIndex = 1;
//    tabarVCS.selectedViewController = secondVC;//两者的结果一样

    //标签试图控制器的样式
    tabarVCS.tabBar.barStyle = UIBarStyleBlackOpaque;
    /*
     UIBarStyleDefault          
     UIBarStyleBlack
     UIBarStyleBlackOpaque
     UIBarStyleBlackTranslucent //弃用。使用UIBarStyleBlack和半透明的属性设置为YES
     */
    
    //设置标签试图控制器的代理
    tabarVCS.delegate = self;
    
        
    //指定为根视图控制器
    self.window.rootViewController = tabarVCS;
    
   
    
    
    
    
    //释放
    [firstVC release];
    [secondVC release];
    [thirdVC release];
    [fourthVC release];
    [fifthVC release];
    [sixthVC release];
    [firstNV release];
  
//    [self tabBarController:tabarVCS animationControllerForTransitionFromViewController:sixthVC toViewController:fifthVC];
//    [self tabBarController:tabarVCS didSelectViewController:secondVC];
    
    return YES;
}

#pragma mark - taBarController Delegate
//控制器不让选中某一个(NO:不让进入某一个控制器  YES://让进入某一个控制器)
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    //控制器选中某一个(调用if  里面的方法 ，否则调用if外面的方法)
    if (([viewController isKindOfClass:[FourthViewController class]])||([viewController isKindOfClass:[FifthViewController class]])) {
       
        NSLog(@"视图控制器之间转变时会调用");
        return NO;//不让进入某一个控制器
    }
    NSLog(@"两个视图控制器之间转变时会调用");
    return YES;//让进入某一个控制器
}

//标签视图控制器中两个视图控制器转变时调用该方法
/*
- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{

    NSLog(@"两个视图控制器之间转变时会调用");
    
    return 0;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"两个视图控制器之间转变时会调用");
}
 


 
 //对标签视图控制器进行edit 是调用该方法
 - (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers
 {
 NSLog(@"对标签视图控制器进行editing 是调用该方法");
 }
 
 //对标签视图控制器进行editing 结束是调用该方法
 - (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
 {
 NSLog(@"对标签视图控制器进行editing 结束是调用该方法");
 }
 
 - (NSUInteger)tabBarControllerSupportedInterfaceOrientations:(UITabBarController *)tabBarController
 {
 
 NSLog(@"sfdghrsth");
 //测试时返回的数字不同时如 （6、7）和 8、20之间的不同（最好逐个测试从6开始）
 
 return 16;
 }
 
 
 */

/*
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
    //该方法有待测试，
    NSLog(@"ceshi");
}
 
 - (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
 {
 NSLog(@"fghdfh");
 return 0;
 }
 
 
 - (UIInterfaceOrientation)tabBarControllerPreferredInterfaceOrientationForPresentation:(UITabBarController *)tabBarController
 {
 
 NSLog(@"dggsvfds");
 return 0;
 }
 
 
 
 */



/*
 - (id)targetForAction:(SEL)action withSender:(id)sender
 {
 NSLog(@"drgfsdr");
 return 0;
 }
 */






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
