//
//  PageControllerView.h
//  CodeCocoaChina
//
//  Created by Mr.TF on 2020/2/17.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PageControllerView : UIView
- (instancetype)initWithFrame:(CGRect)frame andImageList:(NSArray *)arr;
+(PageControllerView *)instance;
@end

NS_ASSUME_NONNULL_END
