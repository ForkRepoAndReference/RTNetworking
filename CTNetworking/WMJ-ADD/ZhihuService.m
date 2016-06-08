//
//  HistoryService.m
//  CTNetworking
//
//  Created by WangMinjun on 6/7/16.
//  Copyright © 2016 Long Fan. All rights reserved.
//

#import "CTAppContext.h"
#import "ZhihuService.h"

@implementation ZhihuService

#pragma mark - CTServiceProtocal
- (BOOL)isOnline
{
    return [CTAppContext sharedInstance].isOnline;
}

- (NSString*)offlineApiBaseUrl
{
    // http://restapi.amap.com/v3/geocode/regeo?key=384ecc4559ffc3b9ed1f81076c5f8424&location=121.45429%2C31.228&output=json
    // http://restapi.amap.com
    // http://news-at.zhihu.com/api/4/news/latest
    return @"http://news-at.zhihu.com/api";
}

- (NSString*)onlineApiBaseUrl
{
    return @"http://news-at.zhihu.com/api";
}

- (NSString*)offlineApiVersion
{
    return @"4";
}

- (NSString*)onlineApiVersion
{
    return @"4";
}

- (NSString*)onlinePublicKey
{
    return @"";
}

- (NSString*)offlinePublicKey
{
    return @"";
}

- (NSString*)onlinePrivateKey
{
    return @"";
}

- (NSString*)offlinePrivateKey
{
    return @"";
}
@end
