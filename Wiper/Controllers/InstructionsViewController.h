//
//  InstructionsViewController.h
//  Wiper
//
//  Created by Sherpa on 15/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstructionsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) NSString *titleSt;
@property (strong, nonatomic) NSArray *dataArr;

@end
