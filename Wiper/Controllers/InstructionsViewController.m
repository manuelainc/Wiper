//
//  InstructionsViewController.m
//  Wiper
//
//  Created by Sherpa on 15/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import "InstructionsViewController.h"
#import "InstructionCell.h"
#import "UIColor+MAIColorScheme.h"

@implementation InstructionsViewController

-(id)initWithCoder:(NSCoder *)aCoder
{
    if (self = [super initWithCoder:aCoder])
    {
    }
    return self;
}

- (void)viewDidLoad{
    
//    NSMutableString *mutableSt = [NSMutableString stringWithCapacity:_instrucctionsArr.count];
//    
//    for (NSString *s in _instrucctionsArr) {
//        [mutableSt appendFormat:@"\u2022 %@", s];
//    }
//    
//    
//    
//    
//    
//    for (int i = 0; i < _instrucctionsArr.count; i++) {
//        if (!_instructionsSt) {
//            _instructionsSt = [NSString stringWithFormat:@"%@", _instrucctionsArr[i]];
//        }
//        _instructionsSt = [NSString stringWithFormat:@"%@\r%@", _instructionsSt, _instrucctionsArr[i]];
//    }
//    
//    self.instructionsTxtVw.text = self.instructionsSt;
//    



}

- (void)viewDidAppear:(BOOL)animated{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self dataArr].count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifer = @"instructionCell";
    InstructionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    // Using a cell identifier will allow your app to reuse cells as they come and go from the screen.
    if (cell == nil)
    {
        cell = [[InstructionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    UIImage *img = [UIImage imageNamed:[[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:3]];
    
    cell.iconImg.image = img;
    cell.titleLbl = [[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:0];
    cell.backgroundColor = [UIColor getColorForSection:[[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:0]];
    cell.instructionTxtVw.text = [[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:2];

    NSLog(@"size of cell %f", cell.frame.size.height);
    NSLog(@"size of textview %f", cell.instructionTxtVw.frame.size.height);

    //
//    cell.titleLbl.text = [[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:1];
//    UIImage *img = [UIImage imageNamed:[[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:3]];
//    [cell.imageVw setImage:img];
//    
//    cell.backgroundColor = [UIColor getColorForSection:[[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:0]];
//    cell.topVw.layer.cornerRadius = cell.topVw.frame.size.width/2;
//    // Deciding which data to put into this particular cell.
//    // If it the first row, the data input will be "Data1" from the array.
    
    return cell;
}



















@end
