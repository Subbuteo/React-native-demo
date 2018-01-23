//
//  ViewController.m
//  weatherMonitor
//
//  Created by Chih on 20/1/18.
//  Copyright © 2018 Zhi Yang. All rights reserved.
//

#import "HomePageViewController.h"
#import "ShowInfoViewController.h"

@interface HomePageViewController ()
@property (retain, nonatomic) UIView *naviView;
@property (retain, nonatomic) UITableView *tableView;
@property NSMutableArray *tmp;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initProperties];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)initProperties{
    _naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
//    [_naviView setBackgroundColor:[UIColor colorWithRed:72.0/255.0 green:157.0/255.0 blue:222.0/255.0 alpha:1.0]];
    [_naviView setHidden:YES];
    UILabel *title_label = [[UILabel alloc] initWithFrame:CGRectMake(40, 64, self.view.frame.size.width - 80, 128)];
    title_label.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-cloud"];
    [title_label setFont:[UIFont fontWithName:@"FontAwesome" size:80]];
    title_label.textAlignment = NSTextAlignmentCenter;
    title_label.textColor = [UIColor whiteColor];
    
    UIView *checkView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x  + 40, self.view.frame.size.height/2.0 + 20, self.view.frame.size.width - 80, 44)];
    checkView.backgroundColor = [UIColor clearColor];
    [GlobalUtility addTapGestureToView:checkView initWithTarget:self withSelector:@selector(onCheck) enableInteraction:YES];
    
    UILabel *checkBtn = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, checkView.frame.size.width/3*2, checkView.frame.size.height)];
    checkBtn.text = @"Check Weather";
    checkBtn.textColor = [UIColor whiteColor];
    [checkBtn setFont:[UIFont systemFontOfSize:17]];
    checkBtn.textAlignment = NSTextAlignmentRight;

    UILabel *checkIcon = [[UILabel alloc] initWithFrame:CGRectMake(checkBtn.frame.origin.x  + checkBtn.frame.size.width + 10, 0, checkView.frame.size.width - checkBtn.frame.size.width, checkView.frame.size.height)];
    checkIcon.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-search"];
    [checkIcon setFont:[UIFont fontWithName:@"FontAwesome" size:22]];
    checkIcon.textAlignment = NSTextAlignmentLeft;
    checkIcon.textColor = [UIColor whiteColor];
    
    [checkView addSubview:checkBtn];
    [checkView addSubview:checkIcon];
    
//    UIView *bgImg = [[UIView alloc] initWithFrame:CGRectMake(0, _naviView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - _naviView.frame.size.height)];
    UIView *bgImg = [[UIView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    [bgImg setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImg.png"]]];
    
    [self.view addSubview:_naviView];
    [self.view addSubview:bgImg];
    [bgImg addSubview:title_label];
    [bgImg addSubview:checkView];
}

-(void)onCheck{
    NSString *location = @"1100661/";
    NSDate *date = [NSDate date];
    NSDate *lastDay = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:lastDay];
    NSLog(@"the last day is %@", currentDateStr);
//    [[NetworkCore sharedInstant] searchCityInfo:location andDateInfo:currentDateStr Completion:^(id response, NSString *successMsg, NSString *errorMsg){
//        if (errorMsg == nil) {
////            NSLog(@"-----------------------%d", response.count);
//            _tmp = response;
////            self.currentItem = [[WMItem alloc] initWithDictionary:response];
//
//        }else{
//            NSLog(@"--------------- %@", errorMsg);
//        }
//    }];
    ShowInfoViewController *vc = [[ShowInfoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSString *)processCheck{
//    NSString *location = @"1100661/";
    NSDate *date = [NSDate date];
    NSDate *lastDay = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:lastDay];
    NSLog(@"the last day is %@", currentDateStr);
    return currentDateStr;
}


@end
