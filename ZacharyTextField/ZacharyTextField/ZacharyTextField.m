//
//  ZacharyTextField.m
//  CusAnimationTestField
//
//  Created by zachary spark on 2018/3/15.
//  Copyright © 2018年 Struggle3g. All rights reserved.
//

#import "ZacharyTextField.h"
#import "UIView+NSStringImage.h"

#define MyViewScreenWidth 200

#define MyViewScreenHeight 30

@interface ZacharyTextField()<UITextFieldDelegate>
{
    
    BOOL IsEditlock;
    BOOL IsEditBackLock;
    
    
}
/**活动的TextField的控件*/
@property(nonatomic,strong)UITextField *ZsTextField;
/**目前做的是将字符串直接生成图片进行的动画效果*/
@property(nonatomic,strong)UIImageView *ZsImageView;
@property(nonatomic,strong)UILabel *ZsdefaultsLable;
@end

@implementation ZacharyTextField

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        [self CreateParameter]; //初始化参数
        [self CreateView];//初始化控件
    }
    
    return  self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if(self){
        [self CreateParameter]; //初始化参数
        [self CreateView];//初始化控件
    }
    
    return self;
}

- (void)CreateParameter{
    
    IsEditlock = NO;
    IsEditBackLock = YES;
    
}

- (void)CreateView{

    self.backgroundColor = [UIColor redColor];
    [self addSubview:self.ZsImageView];
    [self addSubview:self.ZsTextField];
    
}

- (void)ZacharyResignFirstResponder{
    [self.ZsTextField resignFirstResponder];
    if([self.ZsTextField.text isEqualToString:@""]){
        [self StopEditingAnimaiton];
    }

}

- (void)StopEditingAnimaiton{
    
    if(IsEditBackLock) return;
    IsEditBackLock = YES;
    IsEditlock = NO;
    self.ZsImageView.center = CGPointMake(0, 0);
    self.ZsImageView.layer.anchorPoint = CGPointMake(0, 0);//缩小的中心点
    //移动动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];///.y的话就向下移动。
    animation.toValue = [NSNumber numberWithFloat:self.frame.size.height - MyViewScreenHeight];
    //缩小动画
    CABasicAnimation *ZoomAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    ZoomAnima.fromValue = [NSNumber numberWithFloat:0.8];
    ZoomAnima.toValue = [NSNumber numberWithFloat:1];
    
    CAAnimationGroup *AnimationGroup = [CAAnimationGroup animation];
    AnimationGroup.animations = @[animation,ZoomAnima];
    AnimationGroup.duration = 0.3;
    AnimationGroup.removedOnCompletion = NO;
    AnimationGroup.fillMode = kCAFillModeForwards;
    [self.ZsImageView.layer addAnimation:AnimationGroup forKey:@"groupAnimation"];

}



//开始编辑的动画
- (void)TextUpAnimation{
    if(IsEditlock){
        return;
    }
    IsEditlock = YES;
    IsEditBackLock = NO;
    self.ZsImageView.center = CGPointMake(0, self.frame.size.height - MyViewScreenHeight);
    self.ZsImageView.layer.anchorPoint = CGPointMake(0, 0);//缩小的中心点
    
    //移动动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];///.y的话就向下移动。
    animation.toValue = [NSNumber numberWithFloat:-(self.frame.size.height - MyViewScreenHeight)];

    //缩小动画
    CABasicAnimation *ZoomAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    ZoomAnima.fromValue = [NSNumber numberWithFloat:1];
    ZoomAnima.toValue = [NSNumber numberWithFloat:0.8];

    CAAnimationGroup *AnimationGroup = [CAAnimationGroup animation];
    AnimationGroup.animations = @[animation,ZoomAnima];
    AnimationGroup.duration = 0.3;
    AnimationGroup.removedOnCompletion = NO;
    AnimationGroup.fillMode = kCAFillModeForwards;
    [self.ZsImageView.layer addAnimation:AnimationGroup forKey:@"groupAnimation"];

    
}


#pragma mark -- 点语法， 以及setter getter方法，懒加载
- (UITextField *)ZsTextField{
    if(_ZsTextField != nil) return _ZsTextField;
    UITextField *TextField = [[UITextField alloc]initWithFrame:CGRectMake(0, self.frame.size.height - MyViewScreenHeight, self.frame.size.width, MyViewScreenHeight)];
    TextField.delegate = self;
    TextField.returnKeyType = UIReturnKeyJoin;
    _ZsTextField = TextField;
    return TextField;
}

//懒加载
- (UIImageView *)ZsImageView{
    
    if(_ZsImageView != nil) return _ZsImageView;
    
    UIImageView *ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,self.frame.size.height - MyViewScreenHeight, MyViewScreenWidth, MyViewScreenHeight)];
    ImageView.backgroundColor = [UIColor greenColor];
    
    UIImage *Image = sMakeImage(CGSizeMake(MyViewScreenWidth, MyViewScreenHeight), NO, 0, ^(CGContextRef context) {
        UIColor* color = [UIColor colorWithRed:64/255.0 green:64/255.0 blue:107/255.0 alpha:1];
        
        NSMutableParagraphStyle*ParagraphStyle = [[NSMutableParagraphStyle alloc]init];
        
        ParagraphStyle.alignment = NSTextAlignmentLeft;
        
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20], NSFontAttributeName,color,NSForegroundColorAttributeName,ParagraphStyle,NSParagraphStyleAttributeName,nil];
        
        NSString* indexAsString = @"Password";
        [indexAsString drawInRect:CGRectMake(0,0, MyViewScreenWidth, MyViewScreenHeight) withAttributes:dict];
        
    });
    ImageView.image = Image;
    _ZsImageView = ImageView;
    return ImageView;
    
}



#pragma  mark -- UITextFeildDelagete
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self TextUpAnimation];
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self ZacharyResignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self ZacharyResignFirstResponder];
    return  YES;
    
}


@end
