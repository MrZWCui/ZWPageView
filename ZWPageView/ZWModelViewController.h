//
//  ZWModelViewController.h
//  ZWPageView
//
//  Created by 崔先生的MacBook Pro on 2023/3/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWModelViewController : UIViewController

+ (ZWModelViewController *)creatWithIndex:(int)index;

@property (nonatomic, strong) UILabel *indexLabel;

@end

NS_ASSUME_NONNULL_END
