//
//  AXServiceFactory.h
//  RTNetworking
//
//  Created by casa on 14-5-12.
//  Copyright (c) 2014年 casatwy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTService.h"

@interface CTServiceFactory : NSObject

+ (instancetype)sharedInstance;

/**
 根据identifier获取Service
 */
- (CTService<CTServiceProtocal> *)serviceWithIdentifier:(NSString *)identifier;

@end
