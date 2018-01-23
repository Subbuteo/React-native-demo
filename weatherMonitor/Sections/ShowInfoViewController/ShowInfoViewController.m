//
//  ShowInfoViewController.m
//  weatherMonitor
//
//  Created by zhi yang on 20/1/18.
//  Copyright © 2018 Zhi Yang. All rights reserved.
//

#import "ShowInfoViewController.h"

#import "HomePageViewController.h"
#import "ShowInfoView.h"

@interface ShowInfoViewController ()

@end

@implementation ShowInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Weather Info";
    
    ShowInfoView* infoView = [[ShowInfoView alloc] initWithFrame:self.view.bounds];
    self.view = infoView;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
