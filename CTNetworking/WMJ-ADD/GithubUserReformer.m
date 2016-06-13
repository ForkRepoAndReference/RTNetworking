//
//  GithubUserReformer.m
//  CTNetworking
//
//  Created by WangMinjun on 6/13/16.
//  Copyright © 2016 Long Fan. All rights reserved.
//

#import "GithubSearchUsersManager.h"
#import "GithubUserReformer.h"

NSString* const kPropertyListDataKeyGithubUserName = @"kPropertyListDataKeyGithubUserName";

@implementation GithubUserReformer

- (id)manager:(CTAPIBaseManager*)manager reformData:(NSDictionary*)data
{
    if ([manager isKindOfClass:[GithubSearchUsersManager class]]) {
        return [self reformWithData:data]; //这是调用了派生后reformer子类自己实现的函数，别忘了reformer自己也是一个对象呀。
        //reformer也可以有自己的属性，当进行业务逻辑需要一些外部的辅助数据的时候，
        //外部使用者可以在使用reformer之前给reformer设置好属性，使得进行业务逻辑时，
        //reformer能够用得上必需的辅助数据。
    }

    //    if ([manager isKindOfClass:[zufangManager class]]) {
    //        return [self zufangPhoneNumberWithData:data];
    //    }
    //
    //    if ([manager isKindOfClass:[ershoufangManager class]]) {
    //        return [self ershoufangPhoneNumberWithData:data];
    //    }
    return nil;
}

- (id)reformWithData:(NSDictionary*)data
{
    NSArray* items = data[@"items"];
    NSMutableArray* result = [[NSMutableArray alloc] init];
    [items enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
        [result addObject:@{ kPropertyListDataKeyGithubUserName : obj[@"login"] }];
        //        dict = @{ kPropertyListDataKeyGithubUserName : obj[@"login"] };
    }];

    return [result copy];
}

@end
