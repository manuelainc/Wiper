//
//  SearchViewController.h
//  Wiper
//
//  Created by Sherpa on 13/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, copy) NSArray* dataArr;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionViewSea;
@property (strong, nonatomic) IBOutlet UIButton *okButton;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *vissualEffectOkBtn;

- (IBAction)okButtonPressed:(id)sender;

@end
