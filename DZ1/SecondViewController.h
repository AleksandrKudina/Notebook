//
//  SecondViewController.h
//  DZ1
//
//  Created by Александр Кудина on 07.08.16.
//  Copyright © 2016 Aleksandr Kudina. All rights reserved.
//

#import <UIKit/UIKit.h>
// объявляем протокол добавления сообщения
@protocol AddMessageProtocol

// метод который будет вызываться когда мы добавили сообщение
- (void)didAddMessage:(NSDictionary *) message;

@end

@interface SecondViewController : UIViewController

// создаем свойство - делегат. то есть объект которому будет передано сообщение о завершении добавления сообщения.
// этот делегат может быть объектом любого класса ( UIView, NSDictionary и тп), но он должен соответствовать протоколу AddMessageProtocol
@property (nonatomic, weak) id <AddMessageProtocol> delegate;
// по делегату - отлично, все верно написал

@end
