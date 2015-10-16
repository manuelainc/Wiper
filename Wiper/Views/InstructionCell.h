//
//  InstructionCell.h
//  Wiper
//
//  Created by Sherpa on 16/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstructionCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UITextView *instructionTxtVw;
@property (nonatomic, strong) IBOutlet UILabel *titleLbl;
@property (nonatomic, strong) IBOutlet UIImageView *iconImg;

@end
