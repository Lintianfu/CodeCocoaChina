//
//  SegmentControllerView.m
//  CodeCocoaChina
//
//  Created by Mr.TF on 2020/2/18.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

#import "SegmentControllerView.h"
#define s_width [[UIScreen mainScreen] bounds].size.width
#define s_height [[UIScreen mainScreen]bounds].size.height
@interface SegmentControllerView()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentV;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollV;
@property(strong,nonatomic)UIImageView *imageV1;
@property(strong,nonatomic)UIImageView *imageV2;
@property(nonatomic,strong)NSArray *images;
@end
@implementation SegmentControllerView

+(SegmentControllerView *)instance
{
    NSArray *nibArray=[[NSBundle mainBundle]loadNibNamed:@"SegmentControllerView" owner:self options:nil];
    return [nibArray objectAtIndex:0];
}
-(instancetype)initWithFrame:(CGRect)frame andImageList:(NSArray *)arr
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.frame=frame;
        self.images=arr;
        self.backgroundColor=[UIColor whiteColor];
        [self setViews];
    }
    return self;
}
-(void)setViews
{
    self.scrollV.frame=CGRectMake(0, s_height*0.15, s_width, s_height*0.85);
    self.scrollV.contentSize=CGSizeMake(s_width*[self.images count], s_height*0.85);
    self.scrollV.delegate=self;
    self.scrollV.showsHorizontalScrollIndicator=YES;
    self.scrollV.showsVerticalScrollIndicator=NO;
    self.scrollV.decelerationRate=1;
    
    self.imageV1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, s_width, self.scrollV.frame.size.height)];
    self.imageV1.image=[UIImage imageNamed:[self.images objectAtIndex:0]];
    
    self.imageV2=[[UIImageView alloc]initWithFrame:CGRectMake(s_width, 0, s_width, self.scrollV.frame.size.height)];
    self.imageV2.image=[UIImage imageNamed:[self.images objectAtIndex:1]];
  
    self.segmentV.frame=CGRectMake(0, 0, s_width/2, s_height*0.05);
    self.segmentV.center=CGPointMake(s_width/2, s_height*0.125);
    self.segmentV.selectedSegmentIndex=0;
    
    [self.scrollV addSubview:self.imageV1];
    [self.scrollV addSubview:self.imageV2];
    [self addSubview:self.segmentV];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset=scrollView.contentOffset;
    NSInteger segment_index=offset.x/s_width;
    self.segmentV.selectedSegmentIndex=segment_index;
}
- (IBAction)changeSegment:(id)sender {
    UISegmentedControl *segment=(UISegmentedControl *)sender;
    if(segment.selectedSegmentIndex==0)
    {
        self.scrollV.contentOffset=CGPointMake(0, 0);
    }
    else{
        self.scrollV.contentOffset=CGPointMake(s_width, 0);
    }
    
}

@end
