//
//  ViewController.m
//  MyServe
//
//  Created by apple on 16/12/15.
//  Copyright © 2016年 BigShow1949. All rights reserved.
//

#import "ViewController.h"

#import "AFHTTPSessionManager.h"
#import "AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self testLogin];
    [self testAsset];
    
}

- (void)testLogin {
    
    // http://localhost:8080/assetApp/login?password=123456&username=zhangsan
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/json",@"text/html",@"application/json",@"text/plain", nil];
    NSString *url=@"http://10.100.70.234:8080/assetApp/login";
    NSDictionary *dic = @{@"username":@"zhangsan",
                          @"password":@"123456"};
    [manager GET:url parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"dic = %@", dic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error = %@", error);
    }];
}

- (void)testAsset {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/json",@"text/html",@"application/json",@"text/plain", nil];
    NSString *url=@"http://10.100.70.234:8080/assetApp/assetList";
    //带有headers参数
    [manager.requestSerializer setValue:@"e566288ba77de98d" forHTTPHeaderField:@"sessionid"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"content-Type"];
    
    [manager POST:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"dic = %@", dic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error = %@", error);
    }];
}


@end
