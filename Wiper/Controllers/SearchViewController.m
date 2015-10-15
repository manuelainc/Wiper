//
//  SearchViewController.m
//  Wiper
//
//  Created by Sherpa on 13/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import "SearchViewController.h"
#import "HeaderCollectionReusableView.h"
#import "UIColor+MAIColorScheme.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionViewSea registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    NSInteger viewWidth = collectionView.frame.size.width;
    NSInteger totalCellWidth;
    NSInteger totalSpacingWidth;
    
    if ([[UIScreen mainScreen] bounds].size.height <= 568){
        totalCellWidth = 50 * 4;
        totalSpacingWidth = 10 * (4 -1);
    }else{
        totalCellWidth = 50 * 5;
        totalSpacingWidth = 10 * (5 -1);
    }

    
    
    
    
    NSInteger leftInset = (viewWidth - (totalCellWidth + totalSpacingWidth)) / 2;
    NSInteger rightInset = leftInset;
    
    return UIEdgeInsetsMake(0, leftInset, 0, rightInset);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 6;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 11;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 13;
            break;
        case 3:
            return 1;
            break;
        case 4:
            return 6;
            break;
        case 5:
            return 9;
            break;
            
        }
    
    return [self.dataArr count];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    int position = 0;
    
    switch (indexPath.section) {
        case 0:
            position = 0;
            break;
        case 1:
            position = position + 11;
            break;
        case 2:
            position = position + 14;
            break;
        case 3:
            position = position + 27;
            break;
        case 4:
            position = position + 28;
            break;
        case 5:
            position = position + 34;
            break;
            
    }
    
    position = position + (int)indexPath.row;
    
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [[self.dataArr objectAtIndex:position] objectAtIndex:0];
        headerView.label.text = title;
        headerView.label.layer.cornerRadius = 20;
        headerView.label.layer.masksToBounds = YES;
        
        
        
        
        
        headerView.label.backgroundColor = [UIColor getColorForSection:[[self.dataArr objectAtIndex:position] objectAtIndex:0]];;
        
        reusableview = headerView;
    }
    
    
    return reusableview;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    int position = 0;
    
    switch (indexPath.section) {
        case 0:
            position = 0;
            break;
        case 1:
            position = position + 11;
            break;
        case 2:
            position = position + 14;
            break;
        case 3:
            position = position + 27;
            break;
        case 4:
            position = position + 28;
            break;
        case 5:
            position = position + 34;
            break;
            
    }

    position = position + (int)indexPath.row;
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[self.dataArr objectAtIndex:position] objectAtIndex:3]]];
//    cell.backgroundView.alpha = 0.8;
//    
//    cell.backgroundColor = [UIColor yellowColor];
    
    return cell;
    
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
