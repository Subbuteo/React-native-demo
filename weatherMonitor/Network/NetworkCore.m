//
//  NetworkCore.m
//  weatherMonitor
//
//  Created by Chih on 20/1/18.
//  Copyright © 2018 Zhi Yang. All rights reserved.
//

#import "NetworkCore.h"


@implementation NetworkCore


+(NetworkCore *)sharedInstant{
    static NetworkCore *_sharedInstant = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstant = [[self alloc] init];
        
    });
    return _sharedInstant;
}

-(void)searchItemInfo:(NSString *)info curentDate:(NSString *)date Completion:(ResponseHandler)completion{
//    NSDictionary *params = @{};
//    NSString *details = [woeid stringByAppendingString:date];
//    NSString *tmp = [@"/location" stringByAppendingString:details];
//    [self createGetRequestFor:tmp withParams:params withCompletion:^(id response, NSString *successMsg, NSString *errorMsg) {
//        if (errorMsg == nil) {
//            NSLog(@"Success sent request");
//        }
//        if (completion != nil) {
//            completion(response,successMsg,errorMsg);
//        }
//    }];

}

-(void)searchCityInfo:(NSString *)woeid andDateInfo:(NSString *)date Completion:(ResponseHandler)completion{
    NSDictionary *params = @{};
    NSString *details = [woeid stringByAppendingString:date];
    NSString *tmp = [@"/location/" stringByAppendingString:details];
    [self createGetRequestFor:tmp withParams:params withCompletion:^(id response, NSString *successMsg, NSString *errorMsg) {
        if (errorMsg == nil) {
            NSLog(@"Success sent request");
        }
        if (completion != nil) {
            completion(response,successMsg,errorMsg);
        }
    }];
}

#pragma mark - Base GET
-(void)createGetRequestFor:(NSString *)path withParams:(NSDictionary *)params withCompletion:(ResponseHandler)completion {
    NSString *urlString = [NSString stringWithFormat:@"%@%@", WM_API_SEARCh_URL, path];
    [self GET: urlString parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (completion != nil) {
            NSString *successMsg = nil;
            if ([responseObject respondsToSelector:@selector(stringValueForKey:)]) {
                [responseObject stringValueForKey:@"success"];
            }
            completion(responseObject, successMsg, nil);
//            NSLog(@"\nGet %@:\n%@\n", path,responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (completion != nil) {
            NSString *errorMsg = [self parseErrorMessageWithOperation:operation andError:error];
            completion(nil,nil,errorMsg);
//            NSLog(@"\nGET Request Error: %@\n",errorMsg);
        }
    }];
//    NSLog(@"\nGET: %@\nParams: %@\n", urlString, params);
}

- (NSString *)parseErrorMessageWithOperation:(AFHTTPRequestOperation *)operation andError:(NSError *)error {
    if (operation != nil && operation.response.statusCode == 500) {
        return @"server error code:500";
    }
    NSString *desc = @"";
    NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
    if(errorData) {
        id serializedData = [NSJSONSerialization JSONObjectWithData:errorData options:kNilOptions error:nil];
        if ([serializedData isKindOfClass:[NSDictionary class]]) {
            id serializedErrorData = [serializedData objectForKey:@"error"];
            if ([serializedErrorData isKindOfClass:[NSString class]]) {
                return serializedErrorData;
            }
            if ([serializedErrorData isKindOfClass:[NSArray class]]) {
                for(id data in serializedErrorData) {
                    if ([data isKindOfClass:[NSString class]]) {
                        if ([desc length] > 0) {
                            desc = [desc stringByAppendingString:@"\n"];
                        }
                        desc = [desc stringByAppendingString:data];
                    }
                }
            }
        }
        if ([serializedData isKindOfClass:[NSArray class]]) {
            for(id data in serializedData) {
                if ([data isKindOfClass:[NSString class]]) {
                    if ([desc length] > 0) {
                        desc = [desc stringByAppendingString:@"\n"];
                    }
                    desc = [desc stringByAppendingString:data];
                }
            }
        }
    }
    if(desc.length == 0) {
        desc = error.localizedDescription;
    }
    return desc;
}


@end
