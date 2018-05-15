//
//  ZacharyTextField.h
//  CusAnimationTestField
//
//  Created by zachary spark on 2018/3/15.
//  Copyright © 2018年 Struggle3g. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef  void(^TextFieldAction)(BOOL IsChoose);

@interface ZacharyTextField : UIView
/**获取这个控件的Text，也可以直接对它进行赋值*/
@property(nonatomic,copy)NSString *ZacharyTextFieldText;
/**退出编辑模式*/
- (void)ZacharyResignFirstResponder;

@end
