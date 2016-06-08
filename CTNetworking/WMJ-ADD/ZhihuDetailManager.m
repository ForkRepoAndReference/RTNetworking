//
//  ZhihuDetailManager.m
//  CTNetworking
//
//  Created by WangMinjun on 6/7/16.
//  Copyright © 2016 Long Fan. All rights reserved.
//

#import "ZhihuDetailManager.h"

@interface ZhihuDetailManager () <CTAPIManagerValidator>

@end

@implementation ZhihuDetailManager

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
    return @"news/3892357";
}

- (NSString*)serviceType
{
    return kCTServiceZhihuDetail;
}

- (CTAPIManagerRequestType)requestType
{
    return CTAPIManagerRequestTypeGet;
}

- (BOOL)shouldCache
{
    return YES;
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
