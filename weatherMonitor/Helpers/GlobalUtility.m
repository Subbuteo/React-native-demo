//
//  GlobalUtility.m
//  weatherMonitor
//
//  Created by Chih on 20/1/18.
//  Copyright © 2018 Zhi Yang. All rights reserved.
//

#import "GlobalUtility.h"

@implementation GlobalUtility

+(void)addTapGestureToView:(UIView *)view initWithTarget:(id)target withSelector:(SEL)selector enableInteraction:(BOOL)enabled{
    UITapGestureRecognizer *onTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    onTap.numberOfTapsRequired = 1;
    view.userInteractionEnabled = enabled;
    [view addGestureRecognizer:onTap];
}

@end
#pragma mark - NSDictionary Extension
@implementation NSDictionary (Utility)
- (NSString *)stringValueForKey:(NSString *)key {
    id result = [self valueForKey:key];
    if ([result isKindOfClass:[NSString class]]) {
        return result;
    }
    return nil;
}

- (NSNumber *)numberValueForKey:(NSString *)key {
    id result = [self valueForKey:key];
    if ([result isKindOfClass:[NSNumber class]]) {
        return result;
    }
    return nil;
}

- (NSArray *)arrayValueForKey:(NSString *)key {
    id result = [self valueForKey:key];
    if ([result isKindOfClass:[NSArray class]]) {
        return result;
    }
    return nil;
}
@end
