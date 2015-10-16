//
//  ImageCollectionViewCell.h
//  Wiper
//
//  Created by Sherpa on 15/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) IBOutlet UIImageView *imgIcon;
@property (strong, nonatomic) IBOutlet UIView *topVw;

@end
