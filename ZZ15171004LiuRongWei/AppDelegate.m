//
//  AppDelegate.m
//  ZZ15171004LiuRongWei
//
//  Created by qianfeng on 15/12/12.
//  Copyright © 2015年 刘镕玮. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)setViewControllersFor:(UITabBarController *)tbc{
    NSMutableArray *controllers = [NSMutableArray array];
    NSArray *titles = @[@"资讯",@"杂志",@"微言",@"酷图"];
    for (NSUInteger i = 0 ; i < titles.count ; i++) {
        NSString *name = [NSString stringWithFormat:@"ViewController%lu",i+1];
        Class cls = NSClassFromString(name);
        BaseViewController *bvc = [[cls alloc]init];
        NSString *imageName = [NSString stringWithFormat:@"%@_1@2x",titles[i]];
        UIImage *image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        NSString *selectedImageName = [NSString stringWithFormat:@"%@_2@2x",titles[i]];
        UIImage *selectedImage = [[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        UIImage *tabimage = [UIImage imageNamed:@"标题栏底@2x.png"];
        [tbc.tabBar setBackgroundImage:tabimage];
        UITabBarItem *tbi = [[UITabBarItem alloc]initWithTitle:nil image:image selectedImage:selectedImage];
        UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:bvc];
        UIImage *imageground = [UIImage imageNamed:@"标题栏底@2x.png"];
        [nvc.navigationBar setBackgroundImage:imageground forBarMetrics:UIBarMetricsDefault];
        nvc.tabBarItem = tbi;
        [controllers addObject:nvc];
    }
    tbc.viewControllers = controllers;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UITabBarController *tbc = [[UITabBarController alloc]init];
    self.window.rootViewController = tbc;
    [self setViewControllersFor:tbc];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
