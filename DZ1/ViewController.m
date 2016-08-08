//
//  ViewController.m
//  DZ1
//
//  Created by Александр Кудина on 07.08.16.
//  Copyright © 2016 Aleksandr Kudina. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.messageArray = [[NSMutableArray alloc] init];
}

// метод вызываемый системой при переходе с использованием segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueViewController"])
    {
        // получаем указатель на объект второго вьюконтроллера
        SecondViewController *secondViewController = segue.destinationViewController;
        // указываем второму вьюконтроллеру что делегатом будет текущий объект (self), то есть первый вьюконтроллер
        // это значит, что второй вьюконтроллер будет передавать данные через посылку сообщения didAddMessage: сюда, первому вьюконтроллеру
        secondViewController.delegate = self;
    }
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; // задаем количество секций
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.messageArray count]; // задаем количество строк
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"]; //создаем свою ячейку
    NSDictionary *dictionary = [self.messageArray objectAtIndex:indexPath.row]; // заполнем словарь и массива словарей
    cell.titleLabel.text = dictionary[@"odin"]; //выводим сообщение
    
    return cell; //возвращаем созданную ячейку
    
}
//удаление строки с анимацией
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete)	{
        [self.messageArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationFade];
    }
}
// реализация метода протокола AddMessageProtocol
#pragma  mark AddMessageProtocol

- (void)didAddMessage:(NSDictionary *)message{
    [self.messageArray addObject:message]; //добавляем значение в массив
    [self.tableView reloadData]; // перезагрузка таблицы
}



@end
