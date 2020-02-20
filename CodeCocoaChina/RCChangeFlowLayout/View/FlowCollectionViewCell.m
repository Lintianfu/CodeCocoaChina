//
//  FlowCollectionViewCell.m
//  CodeCocoaChina
//
//  Created by Mr.TF on 2020/2/19.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

#import "FlowCollectionViewCell.h"
#import <SDAutoLayout/SDAutoLayout.h>
#define s_width [UIScreen mainScreen].bounds.size.width
@interface FlowCollectionViewCell()
@property(nonatomic,strong)UIImageView *img;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *price;
@property(nonatomic,strong)UILabel *number;
@property(nonatomic,strong)UIButton *buy;
@property(nonatomic,assign)CGFloat width;
@end
@implementation FlowCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        _width=floor((s_width - 30) * 0.5);
        [self setupUI];
    }
    return self;
}
-(void)setupUI
{
    _img=[UIImageView new];
    int index=arc4random()%5;
    _img.image=[UIImage imageNamed:[NSString stringWithFormat:@"yunEr%d.jpg",index+1]];
    _img.layer.masksToBounds=YES;
    _img.contentMode=UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.img];
    
    _name=[UILabel new];
    _name.text=@"允儿，真可爱😊😊😊";
    _name.font=[UIFont systemFontOfSize:14];
    _name.adjustsFontSizeToFitWidth=YES;
    _name.minimumScaleFactor=0.5;
    [self.contentView addSubview:self.name];
    
    _price=[UILabel new];
    _price.text=@"99.9元";
    _price.font = [UIFont boldSystemFontOfSize:13];
    _price.textColor = [UIColor redColor];
    _price.adjustsFontSizeToFitWidth = YES;
    _price.minimumScaleFactor = 0.5;
    [self.contentView addSubview:_price];
    
     _number = [UILabel new];
     _number.text = @"已售999件";
     _number.font = [UIFont systemFontOfSize:12];
     _number.textColor = [UIColor grayColor];
     _number.adjustsFontSizeToFitWidth = YES;
     _number.minimumScaleFactor = 0.5;
    [self.contentView addSubview:self.number];
    
    _buy=[UIButton new];
    [_buy setTitle:@"立即购买" forState:UIControlStateNormal];
     _buy.backgroundColor = [UIColor redColor];
    _buy.titleLabel.font = [UIFont systemFontOfSize:13];
    [_buy addTarget:self action:@selector(buyClick) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_buy];
}
-(void)setListFrame
{
    _img.sd_layout
    .topEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .widthIs(100)
    .heightEqualToWidth();
    
    _name.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(_img, 10)
    .widthIs(s_width-100-20)
    .heightIs(20);
    
    _price.sd_layout
    .topSpaceToView(_name, 0)
    .leftSpaceToView(_img, 10)
    .widthIs(s_width-100-20)
    .heightIs(20);
    
    _number.sd_layout
    .topSpaceToView(_price, 0)
    .leftSpaceToView(_img, 20)
    .widthIs(s_width-100-20)
    .heightIs(20);
    
    _buy.sd_layout
    .topSpaceToView(_number, 0)
    .leftSpaceToView(_img, 10)
    .widthIs(80)
    .heightIs(30);
}
-(void)setGridFrame
{
    _img.sd_layout
    .topSpaceToView(self.contentView, 0)
    .leftEqualToView(self.contentView)
    .widthIs(_width)
    .heightEqualToWidth();
    
    _name.sd_layout
    .topSpaceToView(_img, 0)
    .leftSpaceToView(self.contentView, 10)
    .widthIs(_width-20)
    .heightIs(20);
    
    _price.sd_layout
    .topSpaceToView(_name, 0)
    .leftSpaceToView(self.contentView, 10)
    .widthIs(_width-20)
    .heightIs(20);
    
    _number.sd_layout
    .topSpaceToView(_price, 0)
    .leftSpaceToView(self.contentView, 10)
    .widthIs(80)
    .heightIs(20);
    
    _buy.sd_layout
    .topSpaceToView(_price, 0)
    .leftSpaceToView(_number, 10)
    .heightIs(30)
    .widthIs(80);
}
- (void)setIsList:(BOOL)isList{
    if(isList){
        if(self.animation){
            [UIView animateWithDuration:0.25 animations:^{
                [self setListFrame];
            }];
        }else{
            [self setListFrame];
        }
    }else{
        
        if(self.animation){
            [UIView animateWithDuration:0.25 animations:^{
                [self setGridFrame];
            }];
        }else{
            [self setGridFrame];
        }
    }
    
    if(self.animation){
        [UIView animateWithDuration:0.25 animations:^{
           [self.contentView layoutIfNeeded];
        }];
    }
}
- (void)buyClick{
    NSLog(@"想多了！！！");
}
@end
