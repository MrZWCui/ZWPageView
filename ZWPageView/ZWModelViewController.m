//
//  ZWModelViewController.m
//  ZWPageView
//
//  Created by 崔先生的MacBook Pro on 2023/3/20.
//

#import "ZWModelViewController.h"

@interface ZWModelViewController ()

@end

@implementation ZWModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

+ (ZWModelViewController *)creatWithIndex:(int)index {
    ZWModelViewController *contentViewController = [ZWModelViewController new];
    contentViewController.indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 200, 100, 30)];
    contentViewController.indexLabel.text = [NSString stringWithFormat:@"第%d页", index];
    [contentViewController.view addSubview:contentViewController.indexLabel];
    return contentViewController;
}

@end
