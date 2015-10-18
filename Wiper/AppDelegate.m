//
//  AppDelegate.m
//  Wiper
//
//  Created by Sherpa on 13/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuTabViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MenuTabViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"tabBarController"];
    viewController.dataArray = [self getInfoFromCsvWithName:@"wiperDataSpanish"];

    self.window.rootViewController = viewController;
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
    // Saves changes in the application's managed object context before the application terminates.
}

- (NSArray *)getInfoFromCsvWithName:(NSString*)name{
    NSString *strPath = [[NSBundle mainBundle] pathForResource:name ofType:@"csv"];
    NSString *strFile = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    if (!strFile) {
        NSLog(@"Error reading file.");
    }
    NSArray *arrayReferences = [[NSArray alloc] init];
    arrayReferences = [strFile componentsSeparatedByString:@"\n"];
    
    NSMutableArray *mutArr = [[NSMutableArray alloc]init];
    
    for(NSString *reference in arrayReferences) {
        NSArray *arrayReference = [[NSArray alloc] init];
        arrayReference = [reference componentsSeparatedByString:@";"];
        [mutArr addObject:arrayReference];
    }
    
    return mutArr;

}

@end
