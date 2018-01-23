//
//  GlobalUtility.h
//  weatherMonitor
//
//  Created by Chih on 20/1/18.
//  Copyright © 2018 Zhi Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GlobalUtility : NSObject
+(void)addTapGestureToView:(UIView *)view initWithTarget:(id)target withSelector:(SEL)selector enableInteraction:(BOOL)enabled;

@end

#pragma mark - NSDictionary Extension
@interface NSDictionary (Utility)
- (NSString *)stringValueForKey:(NSString *)key;
- (NSNumber *)numberValueForKey:(NSString *)key;
- (NSArray *)arrayValueForKey:(NSString *)key;
@end
