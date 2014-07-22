//
//  ExpandableCell.h
//  ExpandableTableViewCell
//
//  Created by serhatsezer on 7/23/14.
//  Copyright (c) 2014 serhat sezer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpandableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *descTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *rowCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *rowCountTextLabel;


@end
