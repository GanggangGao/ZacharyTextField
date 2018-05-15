//
//  ViewController.m
//  ZacharyTextField
//
//  Created by zachary spark on 2018/5/16.
//  Copyright © 2018年 gaogang. All rights reserved.
//

#import "ViewController.h"
#import "ZacharyTextField.h"
@interface ViewController ()
{
    
    ZacharyTextField *CusTextField;
}
@property (weak, nonatomic) IBOutlet ZacharyTextField *CusTextField1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CusTextField = [[ZacharyTextField alloc]initWithFrame:CGRectMake(40, 200, 200, 60)];
    [self.view addSubview:CusTextField];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    [CusTextField ZacharyResignFirstResponder];
    [_CusTextField1 ZacharyResignFirstResponder];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
