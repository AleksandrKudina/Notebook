//
//  MyCellTableViewCell.h
//  DZ1
//
//  Created by Александр Кудина on 07.08.16.
//  Copyright © 2016 Aleksandr Kudina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIButton *buttonDeleteCell;


@end
