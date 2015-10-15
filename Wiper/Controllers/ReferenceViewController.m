//
//  ReferenceViewController.m
//  Wiper
//
//  Created by Sherpa on 13/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import "ReferenceViewController.h"
#import "ReferenceTableViewCell.h"
#import "DetailViewController.h"
#import "UIColor+MAIColorScheme.h"

@interface ReferenceViewController ()
@property (strong, nonatomic) IBOutlet UITableView *referenceTableView;

@end

@implementation ReferenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    DetailViewController *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"detailVC"];

    detailVC.categorySt = [[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:0];
    detailVC.titleSt = [[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:1];
    detailVC.descriptionSt = [[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:2];
    detailVC.imageIcon = [UIImage imageNamed:[[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:3]];
    detailVC.note = [[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:4];
    [self.navigationController pushViewController:detailVC animated:YES];
    
    
    
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewCellEditingStyleDelete;
}

// This will tell your UITableView how many rows you wish to have in each section.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self dataArr].count;
}

// This will tell your UITableView what data to put in which cells in your table.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifer = @"refCellIdentifier";
    ReferenceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    // Using a cell identifier will allow your app to reuse cells as they come and go from the screen.
    if (cell == nil)
    {
        cell = [[ReferenceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }

    
    cell.titleLbl.text = [[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:1];
    cell.imageView.image = [UIImage imageNamed:[[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:3]];
    cell.backgroundColor = [UIColor getColorForSection:[[self.dataArr objectAtIndex:indexPath.row] objectAtIndex:0]];
    // Deciding which data to put into this particular cell.
    // If it the first row, the data input will be "Data1" from the array.
    
    return cell;
}


@end
