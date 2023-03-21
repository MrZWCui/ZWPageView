//
//  ViewController.m
//  ZWPageView
//
//  Created by 崔先生的MacBook Pro on 2023/3/20.
//

#import "ViewController.h"
#import "ZWModelViewController.h"

@interface ViewController () <UIPageViewControllerDataSource,UIPageViewControllerDelegate>
{
    //翻页视图控制器对象
    UIPageViewController *_pageViewControl;
    //数据源数组
    NSMutableArray *_dataArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //初始化
    _pageViewControl = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:@{UIPageViewControllerOptionSpineLocationKey:@2, UIPageViewControllerOptionInterPageSpacingKey: @10}];
    //设置翻页视图尺寸
    _pageViewControl.view.bounds = self.view.bounds;
    //设置数据源与代理
    _pageViewControl.delegate = self;
    _pageViewControl.dataSource = self;
    //创建初始界面
    ZWModelViewController *model = [ZWModelViewController creatWithIndex:1];
    ZWModelViewController *model2 = [ZWModelViewController creatWithIndex:2];
    //设置初始界面
    [_pageViewControl setViewControllers:@[model, model2] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    //设置是否双面展示
    _pageViewControl.doubleSided = YES;
    _dataArray = [NSMutableArray new];
    [_dataArray addObject:model];
    [_dataArray addObject:model2];
    [self.view addSubview:_pageViewControl.view];
}

//翻页控制器进行向前翻页动作 这个数据源方法返回的视图控制器为要显示视图的视图控制器
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    //返回当前对象的最低索引
    int index = (int)[_dataArray indexOfObject:viewController];
    if (index == 0) {
        return nil;
    } else {
        return _dataArray[index - 1];
    }
}

//翻页控制器进行向后翻页动作 这个数据源方法返回的视图控制器为要显示视图的视图控制器
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    int index = (int)[_dataArray indexOfObject:viewController];
    if (index == 9) {
        return nil;
    } else {
        if (_dataArray.count - 1 >= index + 1) {
            return _dataArray[index + 1];
        } else {
            ZWModelViewController *model = [ZWModelViewController creatWithIndex:index + 2];
            [_dataArray addObject:model];
            return model;
        }
    }
}

//屏幕旋转触发的代理方法
- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return UIPageViewControllerSpineLocationMid;
}

//设置分页控制器的分页数
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 10;
}

//设置初始的分页点
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}


@end
