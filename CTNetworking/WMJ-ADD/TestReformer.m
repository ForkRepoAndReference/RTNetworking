//
//  TestReformer.m
//  CTNetworking
//
//  Created by WangMinjun on 6/8/16.
//  Copyright © 2016 Long Fan. All rights reserved.
//

#import "TestAPIManager.h"
#import "TestReformer.h"

NSString* const kPropertyListDataKeyAddress = @"kPropertyListDataKeyAddress";
NSString* const kPropertyListDataKeyTowncode = @"kPropertyListDataKeyTowncode";

@implementation TestReformer

- (id)manager:(CTAPIBaseManager*)manager reformData:(NSDictionary*)data
{
    if ([manager isKindOfClass:[TestAPIManager class]]) {
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
    NSDictionary* result = nil;
    result = @{
        kPropertyListDataKeyAddress : data[@"regeocode"][@"formatted_address"],
        kPropertyListDataKeyTowncode : data[@"regeocode"][@"addressComponent"][@"towncode"]
    };
    //    result[@"formatted_address"] = data[@"regeocode"][@"formatted_address"];
    //    result[@"towncode"] = data[@"regeocode"][@"addressComponent"][@"towncode"];
    return result;
}

@end
