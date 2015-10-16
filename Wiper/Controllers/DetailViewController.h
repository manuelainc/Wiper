//
//  DetailViewController.h
//  Wiper
//
//  Created by Sherpa on 13/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *categoryLbl;
@property (strong, nonatomic) IBOutlet UILabel *titleLbl;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTV;
@property (strong, nonatomic) IBOutlet UILabel *noteLbl;
@property (strong, nonatomic) IBOutlet UITextView *noteTV;


@property (nonatomic, copy) NSString *categorySt;
@property (nonatomic, copy) NSString *titleSt;
@property (nonatomic, strong) UIImage *imageIcon;
@property (nonatomic, copy) NSString *descriptionSt;
@property (nonatomic, copy) NSString *note;
@property (nonatomic, strong) UIColor* backgroundColor;
@end
