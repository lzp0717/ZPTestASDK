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
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:TestAObject.class].bundlePath stringByAppendingPathComponent:@"ZPTestASDK.bundle"]];
    UIImage *image = [UIImage imageNamed:@"test" inBundle:bundle compatibleWithTraitCollection:nil];
    NSLog(@"====库里的图片-%@", image);
}
@end
