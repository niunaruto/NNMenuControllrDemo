
//
//  MyTableViewCell.m
//  删除购买置顶
//
//  Created by public on 15/10/28.
//  Copyright © 2015年 public. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell{
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
        UILongPressGestureRecognizer *longp = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longP:)];
        [self addGestureRecognizer:longp];
        
        label.text = @"QQ群:390438081";
        [self addSubview:label];
    }
    return self;
}
- (void)longP:(UILongPressGestureRecognizer *)longRecognizer{
    if ([_delegate respondsToSelector:@selector(longPress:)]) {
        [_delegate longPress:longRecognizer];
        
    }
}

@end
