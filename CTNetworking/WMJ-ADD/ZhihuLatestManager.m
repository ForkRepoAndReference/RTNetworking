//
//  HistoryManager.m
//  CTNetworking
//
//  Created by WangMinjun on 6/7/16.
//  Copyright © 2016 Long Fan. All rights reserved.
//

#import "ZhihuLatestManager.h"

@interface ZhihuLatestManager () <CTAPIManagerValidator>

@end

@implementation ZhihuLatestManager

#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.validator = self;
    }
    return self;
}

#pragma mark - CTAPIManager
- (NSString*)methodName
{
    return @"news/latest";
}

- (NSString*)serviceType
{
    return kCTServiceZhihuLatest;
}

- (CTAPIManagerRequestType)requestType
{
    return CTAPIManagerRequestTypeGet;
}

- (BOOL)shouldCache
{
    return NO;
}

//- (NSDictionary*)reformParams:(NSDictionary*)params
//{
//    NSMutableDictionary* resultParams = [[NSMutableDictionary alloc] init];
//        resultParams[@"key"] = [[CTServiceFactory sharedInstance] serviceWithIdentifier:kCTServiceGDMapV3].publicKey;
//        resultParams[@"location"] = [NSString stringWithFormat:@"%@,%@", params[kTestAPIManagerParamsKeyLongitude], params[kTestAPIManagerParamsKeyLatitude]];
//        resultParams[@"output"] = @"json";
//    return resultParams;
//}

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
    //    if ([data[@"status"] isEqualToString:@"0"]) {
    //        return NO;
    //    }

    return YES;
}

@end
