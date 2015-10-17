//
//  PMDetailViewController.m
//  TableViewKeyBoardDemo
//
//  Created by majian on 15/10/17.
//  Copyright © 2015年 majian. All rights reserved.
//

#import "PMDetailViewController.h"

@interface PMDetailViewController () {
    NSIndexPath * _indexPath;
}
@end

@implementation PMDetailViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSUInteger supportCount = [self.title integerValue] + 1;
    self.title = [NSString stringWithFormat:@"%ld",supportCount];
    if ([self.delegate respondsToSelector:@selector(detailViewController:changeSupportCount:forIndexPath:)]) {
        [self.delegate detailViewController:self
                         changeSupportCount:self.title
                               forIndexPath:_indexPath];
    }
}

#pragma mark - Public Method
- (void)setSupportCount:(NSString *)supportCount indexPath:(NSIndexPath *)indexPath{
    self.title = supportCount;
    _indexPath = indexPath;
}

@end
