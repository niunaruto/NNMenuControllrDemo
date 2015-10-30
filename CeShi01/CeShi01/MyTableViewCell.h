//
//  MyTableViewCell.h
//  删除购买置顶
//
//  Created by public on 15/10/28.
//  Copyright © 2015年 public. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^LongPressBlock)();
@protocol longPressDelegate <NSObject>

- (void)longPress:(UILongPressGestureRecognizer *)longP;

@end
@interface MyTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *stringLabel;
@property (nonatomic, assign) id<longPressDelegate> delegate;
@end
