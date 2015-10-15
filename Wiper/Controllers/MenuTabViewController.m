//
//  MenuTabViewController.m
//  Wiper
//
//  Created by Sherpa on 13/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import "MenuTabViewController.h"
#import "ReferenceViewController.h"
#import "SearchViewController.h"


@interface MenuTabViewController ()

@end

@implementation MenuTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = [self dataArray];
    // Do any additional setup after loading the view.
    
    UINavigationController *nav = [[self viewControllers] objectAtIndex:0];
    
    ReferenceViewController *refVC = nav.viewControllers[0];
    refVC.dataArr = arr;
    
    UINavigationController *navSearc = [[self viewControllers] objectAtIndex:1];

    SearchViewController *searVC = navSearc.viewControllers[0];
    searVC.dataArr = arr;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
