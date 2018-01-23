//
//  ViewController.h
//  weatherMonitor
//
//  Created by Chih on 20/1/18.
//  Copyright © 2018 Zhi Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+FontAwesome.h"
#import "UIImage+FontAwesome.h"
#import "GlobalUtility.h"
#import "NetworkCore.h"
#import "WMBaseModel.h"
#import "WMItem.h"
@interface HomePageViewController : UIViewController

@property(strong, nonatomic) WMItem *currentItem;

@end

