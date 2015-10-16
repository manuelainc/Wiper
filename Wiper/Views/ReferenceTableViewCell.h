//
//  ReferenceTableViewCell.h
//  Wiper
//
//  Created by Sherpa on 13/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReferenceTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLbl;
@property (strong, nonatomic) IBOutlet UIImageView *imageVw;
@property (strong, nonatomic) IBOutlet UIView *topVw;

@property (nonatomic, strong) NSString *titleSt;
@property (nonatomic, strong) UIImage *symbolImg;
@property (nonatomic, strong) UIColor *backgroundClr;

@end
