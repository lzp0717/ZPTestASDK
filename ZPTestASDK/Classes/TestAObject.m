//
//  TestAObject.m
//  ZPTestASDK
//
//  Created by lianzhipeng on 2020/8/1.
//

#import "TestAObject.h"
#import <AFNetworking/AFNetworking.h>

@implementation TestAObject
+ (void)test {
    NSLog(@"%@=====%@", self, [AFNetworkReachabilityManager manager]);
}
@end
