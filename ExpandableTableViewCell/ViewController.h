//
//  ViewController.h
//  ExpandableTableViewCell
//
//  Created by serhatsezer on 7/23/14.
//  Copyright (c) 2014 serhat sezer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (assign) NSInteger selectedIndex;
@property (nonatomic,strong) NSMutableArray *titles;
@property (nonatomic,strong) NSArray *subtitles;
@property (nonatomic,strong) NSArray *texts;
@property (nonatomic,strong) IBOutlet UITableView *tableView;

@end
