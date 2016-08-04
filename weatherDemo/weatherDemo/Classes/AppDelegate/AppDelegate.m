//
//  AppDelegate.m
//  weatherDemo
//
//  Created by 刘安海 on 16/8/4.
//  Copyright © 2016年 刘安海. All rights reserved.
//

#import "AppDelegate.h"
#import "LAWeatherController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

  LAWeatherController *weatherVC = [[LAWeatherController alloc] init];

  weatherVC.view.backgroundColor = [UIColor redColor];

  self.window.rootViewController = weatherVC;

  [self.window makeKeyAndVisible];

  return YES;
}

@end
