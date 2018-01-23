//
//  NetworkCore.h
//  weatherMonitor
//
//  Created by Chih on 20/1/18.
//  Copyright © 2018 Zhi Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "AFNetworking.h"
#import "GlobalUtility.h"
#import "WMConstants.h"

typedef void(^ResponseHandler)(id response, NSString *successMsg, NSString *errorMsg);
typedef void(^ItemsHandler)(NSMutableArray *items, NSString *errorMsg);

@interface NetworkCore : AFHTTPRequestOperationManager
+(NetworkCore *)sharedInstant;

-(void)searchItemInfo:(NSString *)location Completion:(ResponseHandler)completion;

-(void)searchCityInfo:(NSString *)woeid andDateInfo:(NSString *)date Completion:(ResponseHandler)completion;
@end
