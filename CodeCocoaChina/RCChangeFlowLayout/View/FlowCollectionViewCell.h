//
//  FlowCollectionViewCell.h
//  CodeCocoaChina
//
//  Created by Mr.TF on 2020/2/19.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlowCollectionViewCell : UICollectionViewCell
@property(nonatomic,assign)BOOL isList;
@property (nonatomic,assign)BOOL animation;


-(instancetype)initWithFrame:(CGRect)frame;
-(void)setupUI;
-(void)setListFrame;
-(void)setGridFrame;
@end

NS_ASSUME_NONNULL_END
