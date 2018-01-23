//
//  WMItem.h
//  weatherMonitor
//
//  Created by Chih on 20/1/18.
//  Copyright © 2018 Zhi Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMBaseModel.h"
@interface WMItem : WMBaseModel
@property(strong, nonatomic) NSString * weather_state_name;
@property(strong,nonatomic) NSString *created;
@property(strong,nonatomic) NSString *max_temp;
@property(strong,nonatomic) NSString *min_temp;
@end
