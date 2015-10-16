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
#import "ImageCollectionViewCell.h"
#import "InstructionsViewController.h"

@interface SearchViewController ()
@property (nonatomic,copy) NSMutableArray *selectedIcon;
@property (nonatomic, copy) ImageCollectionViewCell *cellItem;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionViewSea registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    self.collectionViewSea.allowsMultipleSelection = YES;
    
    _selectedIcon = [[NSMutableArray alloc]init];
    
    [self backgroundBlur];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self.collectionViewSea reloadData];
}


#pragma mark - CollectionView methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 6;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
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
            return 2;
            break;
        case 4:
            return 6;
            break;
        case 5:
            return 9;
            break;
            
        }
    
    return 0;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [[self.dataArr objectAtIndex:[self getPositionWithIndex:indexPath]] objectAtIndex:0];
        headerView.label.text = title;
       // headerView.label.layer.cornerRadius = 20;
        headerView.label.layer.masksToBounds = YES;
        
        
        int index = [self getPositionWithIndex:indexPath];
        
        
        headerView.label.backgroundColor = [UIColor
                                            getColorForSection:[[self.dataArr objectAtIndex:index] objectAtIndex:0]];
        
        reusableview = headerView;
    }
    
    
    return reusableview;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    _cellItem = (ImageCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    if (!_cellItem) {
        _cellItem = (ImageCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell"
                                                                                       forIndexPath:indexPath];
    }
    
    UIImage *imageICon = [UIImage imageNamed:[[self.dataArr objectAtIndex:[self getPositionWithIndex:indexPath]] objectAtIndex:3]];
    [_cellItem.imgIcon setImage:imageICon];
    [_cellItem.layer setCornerRadius:_cellItem.frame.size.width/8];
    
    int index = [self getPositionWithIndex:indexPath];

    if (_cellItem.selected) {
        _cellItem.backgroundColor = [UIColor getColorForSection:[self.dataArr[index] objectAtIndex:0]];
        _cellItem.imgIcon.alpha = 0.5;
    }else{
        _cellItem.backgroundColor = [UIColor clearColor];
        _cellItem.imgIcon.alpha = 1;
    }
    
    return _cellItem;
    
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    int position = [self getPositionWithIndex:indexPath];
    
    _cellItem = (ImageCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    _cellItem.topVw.backgroundColor = [UIColor redColor];
    _cellItem.backgroundColor = [UIColor getColorForSection:[self.dataArr[position] objectAtIndex:0]];
    _cellItem.imgIcon.alpha = 0.5;
    
    
    [[self selectedIcon] addObject:self.dataArr[position]];
    
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    int position = [self getPositionWithIndex:indexPath];

    _cellItem = (ImageCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    _cellItem.backgroundColor = [UIColor clearColor];
    _cellItem.imgIcon.alpha = 1;
    
    [[self selectedIcon] removeObject:self.dataArr[position]];

}

#pragma mark - actions
- (IBAction)okButtonPressed:(id)sender{
    
    InstructionsViewController *instructionsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"instructionsViewController"];
    NSMutableArray* sel = [[NSMutableArray alloc] init];
    for (NSArray* ar in self.selectedIcon) {
        [sel addObject:ar];
    }
    [self.selectedIcon removeAllObjects];
    [instructionsVC setDataArr:sel];
    
    for (NSIndexPath *indexPath in [self.collectionViewSea indexPathsForSelectedItems]) {
        [self.collectionViewSea deselectItemAtIndexPath:indexPath animated:NO];
    }
    
    
    [self.navigationController pushViewController:instructionsVC animated:YES];
    
    
    
}

#pragma mark - utils
- (int)getPositionWithIndex:(NSIndexPath *)indexPath{

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
            position = position + 29;
            break;
        case 5:
            position = position + 35;
            break;
            
    }
    
    position = position + (int)indexPath.row;
    
    return position;


}

- (UIColor *)getPositionWithString:(NSString *)string{

    return [UIColor getColorForSection:string];

}

- (void)backgroundBlur{
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back.png"]]];
    
    UIImage *backImage = [UIImage imageNamed:@"back.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    // create blur effect
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    // create vibrancy effect
    UIVibrancyEffect *vibrancy = [UIVibrancyEffect effectForBlurEffect:blur];
    
    // add blur to an effect view
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:blur];
    effectView.frame = self.view.frame;
    
    // add vibrancy to yet another effect view
    UIVisualEffectView *vibrantView = [[UIVisualEffectView alloc]initWithEffect:vibrancy];
    vibrantView.frame = self.view.frame;
    
    // add both effect views to the image view
    [backgroundImageView addSubview:effectView];
    [backgroundImageView addSubview:vibrantView];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
