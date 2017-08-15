//
//  GithubSearchUsersAPI.m
//  CTNetworking
//
//  Created by WangMinjun on 6/8/16.
//  Copyright © 2016 Long Fan. All rights reserved.
//

#import "GithubSearchUsersAPI.h"

#import "GithubSearchUsersManager.h"
#import "GithubUserReformer.h"
#import "PropertyListReformerKeys.h"
#import <UIView+LayoutMethods.h>

static NSString* const kCellIdentifier = @"cell";

@interface GithubSearchUsersAPI () <CTAPIManagerParamSource, CTAPIManagerCallBackDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) GithubSearchUsersManager* searchUsersManager;
@property (nonatomic, strong) UIButton* button;

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, copy) NSMutableArray* usersArray;

@property (nonatomic, strong) GithubUserReformer* reformer;

@end

@implementation GithubSearchUsersAPI

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.button];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self layoutButton];
    [self layoutTableView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.searchUsersManager loadData];
}

- (void)layoutButton
{
    [self.button centerEqualToView:self.view];
    [self.button setCt_y:200.0];
}

- (void)layoutTableView
{
    [self.tableView setCt_x:0];
    [self.tableView setCt_y:0];
    [self.tableView setCt_width:self.view.ct_width];
    [self.tableView setCt_height:self.view.ct_height];
}

#pragma mark - CTAPIManagerParamSource
- (NSDictionary*)paramsForApi:(CTAPIBaseManager*)manager
{
    NSDictionary* params = @{};

    if (manager == self.searchUsersManager) {
        params = @{
            kGithubSearchUsersManagerParamsKeySort : @"followers",
            kGithubSearchUsersManagerParamsKeyPage : @(self.searchUsersManager.nextPageNumber),
            kGithubSearchUsersManagerParamsKeyLocation : @"china",
            kGithubSearchUsersManagerParamsKeyLanguage : @"Objective-C"
        };
    }

    return params;
}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager*)manager
{
    if (manager == self.searchUsersManager) {
        [self configWithData:[manager fetchDataWithReformer:self.reformer]];
    }
}

- (void)managerCallAPIDidFailed:(CTAPIBaseManager*)manager
{
    if (manager == self.searchUsersManager) {
        NSLog(@"%@", [manager fetchDataWithReformer:nil]);
    }
}

#pragma mark - Action

- (void)buttonClick
{
    [self.searchUsersManager loadNextPage];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.usersArray.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    NSDictionary* dict = [self.usersArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.%@", indexPath.row, dict[kPropertyListDataKeyGithubUserName]];
    return cell;
}

#pragma mark - private
- (void)configWithData:(id)data
{
    [self.usersArray addObjectsFromArray:(NSArray*)data];
    [self.tableView reloadData];
}

#pragma mark - getters and setters
- (GithubSearchUsersManager*)searchUsersManager
{
    if (_searchUsersManager == nil) {
        _searchUsersManager = [[GithubSearchUsersManager alloc] init];
        _searchUsersManager.delegate = self;
        _searchUsersManager.paramSource = self;
    }
    return _searchUsersManager;
}

- (UIButton*)button
{
    if (_button == nil) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        _button.backgroundColor = [UIColor greenColor];
    }
    return _button;
}

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    }
    return _tableView;
}

- (NSMutableArray*)usersArray
{
    if (_usersArray == nil) {
        _usersArray = [[NSMutableArray alloc] initWithCapacity:30];
    }
    return _usersArray;
}

- (GithubUserReformer*)reformer
{
    if (_reformer == nil) {
        _reformer = [[GithubUserReformer alloc] init];
    }
    return _reformer;
}
@end
