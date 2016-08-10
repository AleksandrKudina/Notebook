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


//Хорошим тоном считается именовать свои классы с префиксом - NS,UI (на самом деле обязательно)
//Apple советует использовать 3х-буквенный префикс, так как 2х зарезервирован под системные фреймворки
//Я еще люблю сокрщать ViewController до VC (это необязательно)
//И не забываем давать осмысленные имена классам
//Как вариант - AKNNotesListVC (Alexander Kudina's Notebook Notes List View Controller)
//Также удобнее всего использовать отдельные XIB-файлы для контроллеров
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.messageArray = [NSMutableArray new];
    
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

//можно не возвращать количество секций, если они не нужны
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; // задаем количество секций
    
}*/

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
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
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
