//
//  WMItem.m
//  weatherMonitor
//
//  Created by Chih on 20/1/18.
//  Copyright © 2018 Zhi Yang. All rights reserved.
//

#import "WMItem.h"

@implementation WMItem
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    self.created = [dictionary stringValueForKey:@"created"];
    self.weather_state_name = [dictionary stringValueForKey:@"weather_state_name"];
    self.min_temp = [dictionary stringValueForKey:@"min_temp"];
    self.max_temp = [dictionary stringValueForKey:@"max_temp"];
    return self;
}
@end
