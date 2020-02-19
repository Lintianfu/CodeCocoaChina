//
//  PageControllerView.h
//  CodeCocoaChina
//
//  Created by Mr.TF on 2020/2/17.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol PageViewDelegate <NSObject>
@optional
-(void)StarNewSegment:(UIButton *)button;
@end

@interface PageControllerView : UIView
- (instancetype)initWithFrame:(CGRect)frame andImageList:(NSArray *)arr;
+(PageControllerView *)instance;

@property(weak,nonatomic)id<PageViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
