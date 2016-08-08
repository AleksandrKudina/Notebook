//
//  ViewController.h
//  DZ1
//
//  Created by Александр Кудина on 07.08.16.
//  Copyright © 2016 Aleksandr Kudina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "MyCell.h"
//  добавляем к объявлению вьюконтроллера нужные протоколы, которым он будет соответствовать
@interface ViewController : UIViewController <UITableViewDataSource, AddMessageProtocol>

@property (nonatomic, weak) IBOutlet UITableView * tableView;
@property (nonatomic, weak) IBOutlet UILabel * labelView;
@property (nonatomic, strong) NSMutableArray * messageArray;

@end

