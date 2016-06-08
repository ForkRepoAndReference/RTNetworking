//
//  GankHistoryAPI.m
//  CTNetworking
//
//  Created by WangMinjun on 6/7/16.
//  Copyright © 2016 Long Fan. All rights reserved.
//

#import "ZhihuLatestAPI.h"

#import "ZhihuLatestManager.h"
#import <UIView+LayoutMethods.h>

@interface ZhihuLatestAPI () <CTAPIManagerParamSource, CTAPIManagerCallBackDelegate>

@property (nonatomic, strong) ZhihuLatestManager* latestManager;
@property (nonatomic, strong) UILabel* resultLable;

@end

@implementation ZhihuLatestAPI

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.resultLable];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self layoutResultLable];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.latestManager loadData];
}

- (void)layoutResultLable
{
    [self.resultLable sizeToFit];
    [self.resultLable centerXEqualToView:self.view];
    [self.resultLable centerYEqualToView:self.view];
}

#pragma mark - CTAPIManagerParamSource
- (NSDictionary*)paramsForApi:(CTAPIBaseManager*)manager
{
    NSDictionary* params = @{};

    //    if (manager == self.testAPIManager) {
    //        params = @{
    //            kTestAPIManagerParamsKeyLatitude : @(31.228000),
    //            kTestAPIManagerParamsKeyLongitude : @(121.454290)
    //        };
    //    }

    return params;
}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager*)manager
{
    if (manager == self.latestManager) {
        self.resultLable.text = @"success";
        NSLog(@"%@", [manager fetchDataWithReformer:nil]);
        [self layoutResultLable];
    }
}

- (void)managerCallAPIDidFailed:(CTAPIBaseManager*)manager
{
    if (manager == self.latestManager) {
        self.resultLable.text = @"fail";
        NSLog(@"%@", [manager fetchDataWithReformer:nil]);
        [self layoutResultLable];
    }
}

#pragma mark - getters and setters
- (ZhihuLatestManager*)latestManager
{
    if (_latestManager == nil) {
        _latestManager = [[ZhihuLatestManager alloc] init];
        _latestManager.delegate = self;
        _latestManager.paramSource = self;
    }
    return _latestManager;
}

- (UILabel*)resultLable
{
    if (_resultLable == nil) {
        _resultLable = [[UILabel alloc] init];
        _resultLable.text = @"loading API...";
    }
    return _resultLable;
}

@end
