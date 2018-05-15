//
//  AppDelegate.h
//  ZacharyTextField
//
//  Created by zachary spark on 2018/5/16.
//  Copyright © 2018年 gaogang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

