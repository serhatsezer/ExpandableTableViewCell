//
//  ViewController.m
//  ExpandableTableViewCell
//
//  Created by serhatsezer on 7/23/14.
//  Copyright (c) 2014 serhat sezer. All rights reserved.
//

#import "ViewController.h"
// import my expanded cell
#import "ExpandableCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // I did this way manually for reuse another project.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // set index to -1 no cell is expanded or should be.
    self.selectedIndex = -1;
    
    self.titles = [NSMutableArray array];
    NSString *tempTitle;
    
    for(int i = 0; i < 8 ; i++) {
        tempTitle = [[NSString alloc] initWithFormat:@"Cell : %i", i];
        [self.titles addObject:tempTitle];
    }
    
    // fill in subtitle label
    self.subtitles = @[@"First Row",@"Second Row",@"Third Row",@"Fourth Row",
                       @"Fith Row",@"Sixth Row",@"Seventh Row",@"Eighth Row"];
    
    // fill in text label
    self.texts  = @[@"Desc 1",@"Desc 2",@"Desc 3",@"Desc 4",
                    @"Desc 5",@"Desc 6",@"Desc 7",@"Desc 8"];
}


#pragma mark
#pragma mark TableView Delegate Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ExpandingCell";
    
    ExpandableCell *cell = (ExpandableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ExpandableCell" owner:self options:nil] objectAtIndex:0];
    }
    
    if(_selectedIndex == indexPath.row) {
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
    } else {
         cell.contentView.backgroundColor = [UIColor clearColor];
    }
    
    cell.titleLabel.text = [self.titles objectAtIndex:indexPath.row];
    cell.subtitleLabel.text = [self.subtitles objectAtIndex:indexPath.row];
    cell.descTextLabel.text = [self.texts objectAtIndex:indexPath.row];
    
    NSInteger calc = (indexPath.row + 1) * 25;
    cell.rowCountLabel.text = [NSString stringWithFormat:@"%li",(long)calc];
    cell.clipsToBounds = YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_selectedIndex == indexPath.row) {
        return 100.0;
    } else {
        return 44.0;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // tapped expanded row
    
    if(_selectedIndex == indexPath.row) {
        _selectedIndex = -1;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
    
    // when tapped different row
    if(_selectedIndex != -1) {
        NSIndexPath *prevIndexPath = [NSIndexPath indexPathForRow:_selectedIndex inSection:0];
        _selectedIndex = indexPath.row;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:prevIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    _selectedIndex = indexPath.row;
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}


@end
