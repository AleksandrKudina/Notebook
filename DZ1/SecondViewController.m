//
//  SecondViewController.m
//  DZ1
//
//  Created by Александр Кудина on 07.08.16.
//  Copyright © 2016 Aleksandr Kudina. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
//REVIEW: не забываем про инкапсуляцию
@property (nonatomic, weak) IBOutlet UITextView * textView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * addButton;
@property (nonatomic, strong) NSMutableDictionary * messageDictionary;
@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.messageDictionary = [[NSMutableDictionary alloc] init];
}

- (IBAction)addMessage:(id)sender //вызывается по нажатии кнопки добавить
{
    [self.messageDictionary setObject:self.textView.text forKey: @"odin"]; //добавляем значение в словарь
    [self.delegate didAddMessage:self.messageDictionary]; // сообщаем делегату (первому вьюконтроллеру), что добавился объект (а он сам уже решит что надо с ним делать)
    [self.navigationController popViewControllerAnimated:YES]; // переходим на контроллер выше
    
}

@end
