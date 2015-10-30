//
//  ViewController.m
//  删除购买置顶
//
//  Created by public on 15/10/28.
//  Copyright © 2015年 public. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#define SCREEN [UIScreen mainScreen].bounds.size
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,longPressDelegate>
@property (nonatomic, strong) UITableView *tabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _tabel.backgroundColor = [UIColor whiteColor];
    _tabel = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN.width, SCREEN.height-64) style:UITableViewStylePlain];
    [self.tabel registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"cell"];
    _tabel.delegate = self;
    _tabel.dataSource = self;
    [self.view addSubview:_tabel];
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.delegate = self;
    return cell;
}
#warning 实现代理方法
- (void)longPress:(UILongPressGestureRecognizer *)longP{
    MyTableViewCell *cell = (MyTableViewCell*)longP.view;
    [cell becomeFirstResponder];
    
    if (longP.state==UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        UIMenuController *menu=[UIMenuController sharedMenuController];
        UIMenuItem *deleItem = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(deleItemClicked:)];
        UIMenuItem *buyItem = [[UIMenuItem alloc] initWithTitle:@"购买" action:@selector(buyItemClicked:)];
        UIMenuItem *topItem = [[UIMenuItem alloc] initWithTitle:@"置顶" action:@selector(topItemClicked:)];
        
        [menu setMenuItems:[NSArray arrayWithObjects:deleItem,buyItem,topItem,nil]];
        [menu setTargetRect:cell.frame inView:cell.superview];
        [menu setMenuVisible:YES animated:YES];
    }
    
    
}

#warning 这个要注意
-(BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)deleItemClicked:(UIMenuItem *)menu{
    NSLog(@"点击了删除按钮");
}
- (void)buyItemClicked:(UIMenuItem *)menu{
    
    NSLog(@"点击了购买按钮");
}
- (void)topItemClicked:(UIMenuItem *)menu{
    
    NSLog(@"点击了置顶按钮");
}
@end
