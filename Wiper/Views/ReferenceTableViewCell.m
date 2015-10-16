//
//  ReferenceTableViewCell.m
//  Wiper
//
//  Created by Sherpa on 13/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import "ReferenceTableViewCell.h"

@implementation ReferenceTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.topVw.layer.cornerRadius = 30;

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self)
    {
        //Changes here after init'ing self
    }
    
    return self;
}

@end
