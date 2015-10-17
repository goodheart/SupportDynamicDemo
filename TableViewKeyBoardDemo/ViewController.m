//
//  ViewController.m
//  TableViewKeyBoardDemo
//
//  Created by majian on 15/10/17.
//  Copyright © 2015年 majian. All rights reserved.
//

#import "ViewController.h"
#import "PMDetailViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray * dataSourceArrayM;
@property (nonatomic,strong) PMDetailViewController * detailViewController;
@end

@interface ViewController (UITableView)<UITableViewDataSource,UITableViewDelegate>
@end

@interface ViewController (DetailViewController)<PMDetailViewControllerChangeSupportDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataSourceArrayM = [NSMutableArray new];
    for (NSUInteger index = 0; index < 20; index++) {
        [self.dataSourceArrayM addObject:[NSString stringWithFormat:@"%ld",index]];
    }
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:NSStringFromClass([self class])];
    
}
@end

@implementation ViewController (UITableView)
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArrayM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    
    cell.textLabel.text = self.dataSourceArrayM[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (nil == _detailViewController) {
        _detailViewController = [[PMDetailViewController alloc] init];
        _detailViewController.delegate = self;
    }
    
    NSString * supportCount = self.dataSourceArrayM[indexPath.row];
    [_detailViewController setSupportCount:supportCount
                                 indexPath:indexPath];
    
    [self.navigationController pushViewController:_detailViewController
                                         animated:YES];
    
}

@end

@implementation ViewController (DetailViewController)

- (void)detailViewController:(PMDetailViewController *)detailVC changeSupportCount:(NSString *)supportCount forIndexPath:(NSIndexPath *)indexPath{
    [self.dataSourceArrayM replaceObjectAtIndex:indexPath.row
                                     withObject:supportCount];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationNone];
}

@end

