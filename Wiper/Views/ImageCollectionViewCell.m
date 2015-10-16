//
//  ImageCollectionViewCell.m
//  Wiper
//
//  Created by Sherpa on 15/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import "UIColor+MAIColorScheme.h"
@implementation ImageCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic_frame.png"]];
        _imgIcon = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:_imgIcon];
    }
    return self;
}

@end
