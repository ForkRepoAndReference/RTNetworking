//
//  GithubSearchUsersManager.m
//  CTNetworking
//
//  Created by WangMinjun on 6/8/16.
//  Copyright © 2016 Long Fan. All rights reserved.
//

#import "GithubSearchUsersManager.h"

NSString* const kGithubSearchUsersManagerParamsKeySort = @"kGithubSearchUsersManagerParamsKeySort";
NSString* const kGithubSearchUsersManagerParamsKeyPage = @"kGithubSearchUsersManagerParamsKeyPage";
NSString* const kGithubSearchUsersManagerParamsKeyLocation = @"kGithubSearchUsersManagerParamsKeyLocation";
NSString* const kGithubSearchUsersManagerParamsKeyLanguage = @"kGithubSearchUsersManagerParamsKeyLanguage";

@interface GithubSearchUsersManager () <CTAPIManagerValidator>

@property (nonatomic, assign) NSInteger totalPropertyCount;
//@property (nonatomic, assign) NSInteger nextPageNumber;

@end

@implementation GithubSearchUsersManager

#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.validator = self;
        self.nextPageNumber = 1;
    }
    return self;
}

#pragma mark - CTAPIManager
- (NSString*)methodName
{
    return @"search/users";
}

- (NSString*)serviceType
{
    return kCTServiceGithubSearchUsers;
}

- (CTAPIManagerRequestType)requestType
{
    return CTAPIManagerRequestTypeGet;
}

- (BOOL)shouldCache
{
    return YES;
}

- (NSDictionary*)reformParams:(NSDictionary*)params
{
    NSMutableDictionary* resultParams = [[NSMutableDictionary alloc] init];

    resultParams[@"sort"] = params[kGithubSearchUsersManagerParamsKeySort];
    resultParams[@"page"] = params[kGithubSearchUsersManagerParamsKeyPage];
    resultParams[@"q"] = [NSString stringWithFormat:@"location:%@+language:%@", params[kGithubSearchUsersManagerParamsKeyLocation], params[kGithubSearchUsersManagerParamsKeyLanguage]];

    return resultParams;
}

#pragma mark - CTAPIManagerValidator
/**
 *  验证参数
 */
- (BOOL)manager:(CTAPIBaseManager*)manager isCorrectWithParamsData:(NSDictionary*)data
{
    return YES;
}

/**
 *  验证返回的数据
 */
- (BOOL)manager:(CTAPIBaseManager*)manager isCorrectWithCallBackData:(NSDictionary*)data
{
    if ([data[@"total_count"] integerValue] == 0) {
        return NO;
    }

    return YES;
}

#pragma mark - CTAPIManagerInterceptor

- (BOOL)beforePerformSuccessWithResponse:(CTURLResponse*)response
{
    BOOL result = YES;

    // 获得总数，并给nextPageNumber加1
    self.totalPropertyCount = [response.content[@"total_count"] integerValue];
    self.nextPageNumber++;

    return result;
}

- (BOOL)beforePerformFailWithResponse:(CTURLResponse*)response
{
    BOOL result = YES;

    // 维护nextPageNumber
    if (self.nextPageNumber > 0) {
        self.nextPageNumber--;
    }

    return result;
}

#pragma mark - 翻页
- (void)loadNextPage
{
    if (self.isLoading) {
        return;
    }

    NSInteger totalPage = ceil(self.totalPropertyCount / 15.0f);
    if (totalPage > 1 && self.nextPageNumber <= totalPage) {
        [self loadData];
    }
}
@end
