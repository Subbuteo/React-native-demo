//
//  ShowInfoView.m
//  weatherMonitor
//
//  Created by zhi yang on 20/1/18.
//  Copyright © 2018 Zhi Yang. All rights reserved.
//

#import "ShowInfoView.h"
#import "RCTBundleURLProvider.h"
#import "RCTRootView.h"

@implementation ShowInfoView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        NSString *strUrl = @"http://192.168.8.105:8081/index.ios.bundle?platform=ios";
        NSURL *jsCodeLocation = [NSURL URLWithString:strUrl];
        
        RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:@"App" initialProperties:nil launchOptions:nil];
        
        [self addSubview:rootView];
        rootView.frame = self.bounds;
    }
    return self;
}
@end
