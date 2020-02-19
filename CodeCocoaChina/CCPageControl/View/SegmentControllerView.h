//
//  SegmentControllerView.h
//  CodeCocoaChina
//
//  Created by Mr.TF on 2020/2/18.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SegmentControllerView : UIView
+(SegmentControllerView *)instance;
-(instancetype)initWithFrame:(CGRect)frame andImageList:(NSArray *)arr;
@end

NS_ASSUME_NONNULL_END
