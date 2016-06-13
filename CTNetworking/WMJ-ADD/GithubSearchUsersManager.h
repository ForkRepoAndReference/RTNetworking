//
//  GithubSearchUsersManager.h
//  CTNetworking
//
//  Created by WangMinjun on 6/8/16.
//  Copyright © 2016 Long Fan. All rights reserved.
//

#import "CTNetworking.h"

extern NSString* const kGithubSearchUsersManagerParamsKeySort;
extern NSString* const kGithubSearchUsersManagerParamsKeyPage;
extern NSString* const kGithubSearchUsersManagerParamsKeyLocation;
extern NSString* const kGithubSearchUsersManagerParamsKeyLanguage;

@interface GithubSearchUsersManager : CTAPIBaseManager <CTAPIManager>

@property (nonatomic, assign) NSInteger nextPageNumber;
- (void)loadNextPage;

@end
