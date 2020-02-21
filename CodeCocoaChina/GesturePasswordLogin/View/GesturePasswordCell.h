//
//  GesturePasswordCell.h
//  CodeCocoaChina
//
//  Created by Mr.TF on 2020/2/21.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GesturePasswordCell : UICollectionViewCell
//item背景色
@property (nonatomic, strong) UIColor *itemBackGoundColor;
//item中间圆球的颜色
@property (nonatomic, strong) UIColor *itemCenterBallColor;
//手势选中
@property (nonatomic, assign) BOOL gestureSelected;
@end

NS_ASSUME_NONNULL_END
