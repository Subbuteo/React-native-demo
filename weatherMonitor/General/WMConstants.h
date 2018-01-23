//
//  WMConstants.h
//  weatherMonitor
//
//  Created by Chih on 20/1/18.
//  Copyright © 2018 Zhi Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMConstants : NSObject

#pragma mark ViewControllers
#define kHomePageViewController @"HomePageViewController"
#define kShowViewController @"ShowViewController"

#pragma mark - Custom Strings
#define safeString(obj) (obj? obj:@"")

#pragma mark - API URL
//extern NSString * const WM_API_URL;
//extern NSString  *const WM_API_BASE_URL;
extern NSString  *const WM_API_SEARCh_URL;
@end
