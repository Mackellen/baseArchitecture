//
//  ViewController.m
//  baseArchitecture
//
//  Created by Mackellen on 16/7/13.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "ViewController.h"
#import "MKAPIManager+User.h"
#import "ViewControllerModel.h"

@interface ViewController ()

@property (nonatomic, strong) ViewControllerModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.viewModel = [ViewControllerModel new];
    
    [[self.viewModel requestData] subscribeNext:^(id x) {
        NSLog(@"result ------>%@",x);
    } error:^(NSError *error) {
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
