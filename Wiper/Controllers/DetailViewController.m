//
//  DetailViewController.m
//  Wiper
//
//  Created by Sherpa on 13/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self categoryLbl].text = [self categorySt];
    [self titleLbl].text = [self titleSt];
    [self image].image = [self imageIcon];
    
    [[self descriptionTV] addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];
    [self descriptionTV].text = [self descriptionSt];
    if ([[UIScreen mainScreen] bounds].size.height == 568){
        [[self descriptionTV] setFont:[UIFont systemFontOfSize:24]];
    }else if([[UIScreen mainScreen] bounds].size.height < 568){
        [[self descriptionTV] setFont:[UIFont systemFontOfSize:20]];
    }
    [self.descriptionTV removeObserver:self forKeyPath:@"contentSize"];
    
    
    if ([self note] && [[self note] isEqualToString:@".\r"]) {
        [[self noteLbl] removeFromSuperview];
        [[self noteTV] removeFromSuperview];
    }else if([self note]){
        [[self descriptionTV] addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];
        [self noteTV].text = [self note];
        [self.descriptionTV removeObserver:self forKeyPath:@"contentSize"];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    UITextView *txtview = object;
    CGFloat topoffset = ([txtview bounds].size.height - [txtview contentSize].height * [txtview zoomScale])/2.0;
    topoffset = ( topoffset < 0.0 ? 0.0 : topoffset );
    txtview.contentOffset = (CGPoint){.x = 0, .y = -topoffset};
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
