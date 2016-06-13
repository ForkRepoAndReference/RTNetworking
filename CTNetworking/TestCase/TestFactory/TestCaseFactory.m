//
//  TestCaseFactory.m
//  CTNetworking
//
//  Created by casa on 15/12/31.
//  Copyright © 2015年 casa. All rights reserved.
//

#import "TestCaseFactory.h"

#import "FireSingleAPI.h"
#import "GithubSearchUsersAPI.h"
#import "ZhihuDetailAPI.h"
#import "ZhihuLatestAPI.h"

@implementation TestCaseFactory

- (UIViewController*)testCaseWithType:(TestCaseType)testCaseType
{
    UIViewController* testCase = nil;

    if (testCaseType == TestCaseTypeFireSingleAPI) {
        testCase = [[FireSingleAPI alloc] init];
    }
    else if (testCaseType == TestCaseTypeZhihuLatestAPI) {
        testCase = [[ZhihuLatestAPI alloc] init];
    }
    else if (testCaseType == TestCaseTypeZhihuDetailAPI) {
        testCase = [[ZhihuDetailAPI alloc] init];
    }
    else if (testCaseType == TestCaseTypeGithubSearchUsersAPI) {
        testCase = [[GithubSearchUsersAPI alloc] init];
    }

    return testCase;
}

@end
