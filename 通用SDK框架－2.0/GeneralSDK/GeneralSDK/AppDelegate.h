//
//  AppDelegate.h
//  GeneralFramework
//
//  Created by user on 14-8-5.
//  Copyright (c) 2014年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Reachability * reach;
@end
