//
//  PMDetailViewController.h
//  TableViewKeyBoardDemo
//
//  Created by majian on 15/10/17.
//  Copyright © 2015年 majian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PMDetailViewController;
//改变点赞的方法
@protocol PMDetailViewControllerChangeSupportDelegate <NSObject>
@optional
- (void)detailViewController:(PMDetailViewController *)detailVC
          changeSupportCount:(NSString *)supportCount
                forIndexPath:(NSIndexPath *)indexPath;

@end

@interface PMDetailViewController : UIViewController
@property (nonatomic,weak) id<PMDetailViewControllerChangeSupportDelegate> delegate;
- (void)setSupportCount:(NSString *)supportCount indexPath:(NSIndexPath *)indexPath;

@end
