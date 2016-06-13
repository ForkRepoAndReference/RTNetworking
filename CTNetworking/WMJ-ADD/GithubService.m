//
//  GithubService.m
//  CTNetworking
//
//  Created by WangMinjun on 6/8/16.
//  Copyright © 2016 Long Fan. All rights reserved.
//

#import "CTAppContext.h"
#import "GithubService.h"

@implementation GithubService

#pragma mark - CTServiceProtocal
- (BOOL)isOnline
{
    return [CTAppContext sharedInstance].isOnline;
}

- (NSString*)offlineApiBaseUrl
{
    return @"https://api.github.com";
}

- (NSString*)onlineApiBaseUrl
{
    return @"https://api.github.com";
}

- (NSString*)offlineApiVersion
{
    return @"";
}

- (NSString*)onlineApiVersion
{
    return @"";
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
