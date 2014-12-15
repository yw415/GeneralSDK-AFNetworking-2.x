//
//  MainViewController.m
//  GeneralFramework
//
//  Created by user on 14-8-5.
//  Copyright (c) 2014年 ios. All rights reserved.
//

#import "MainViewController.h"
#import "ConfigSDK.h"
#import "HttpRequestSDK.h"
#import "UtilitySDK.h"
#import "RegisterOrLoginInfoModel.h"
@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - 界面生命周期
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 按钮方法
// 单个请求
-(IBAction)postClick:(id)sender
{
    //设置参数
    NSMutableDictionary * dic=[NSMutableDictionary dictionaryWithCapacity:3];
    [dic setObject:@"Acj001" forKey:@"username"];
    [dic setObject:@"123456" forKey:@"password"];
    [dic setObject:@"captcha" forKey:@"captcha"];
    
    [[HttpRequestSDK Instance]requestWithType:URL_User_Login
                                   parameters:dic
                                 successBlock:^(id json) {
                                     RegisterOrLoginInfoModel * model=(RegisterOrLoginInfoModel *)json;
                                     NSLog(@"UserID:%@",model.userID);
                                     NSLog(@"Key:%@",model.key);
                                     NSLog(@"AreaID:%@",model.areaID);
                                     NSLog(@"UserName:%@",model.userName);
                                     NSLog(@"UA:%@",model.ua);
        
    }
                                    failBlock:^{
        
    }];
}

// 多个请求
-(IBAction)multiClick:(id)sender
{
    //设置参数
    NSMutableDictionary * dic=[NSMutableDictionary dictionaryWithCapacity:3];
    [dic setObject:@"Acj001" forKey:@"username"];
    [dic setObject:@"123456" forKey:@"password"];
    [dic setObject:@"captcha" forKey:@"captcha"];
    
    id operation=nil;
    operation=[[HttpRequestSDK Instance]createRequest:URL_User_Login
                                           parameters:dic
                                         successBlock:^(NSString *taskURL, id responseObject) {
        
    }
                                            failBlock:^(NSString *taskURL, NSError *error) {
        
    }];
    
    NSArray * array=[NSArray arrayWithObject:operation];
    [[HttpRequestSDK Instance]requestWithQueue:array
                                     queueType:NormalQueue
                          queueCompletionBlock:^(NSArray *operations) {
                              NSLog(@"队列完成");
        
    }
                                queueFailBlock:^{
                                    NSLog(@"队列失败");
        
    }];
    
}
@end
