//
//  SegmentViewController.m
//  CodeCocoaChina
//
//  Created by Mr.TF on 2020/2/18.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

#import "SegmentViewController.h"
#import "SegmentControllerView.h"
@interface SegmentViewController ()
@property(nonatomic,strong)NSArray *images_arr;
@property(nonatomic,strong)SegmentControllerView *segmentV;
@end

@implementation SegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.segmentV];
    // Do any additional setup after loading the view.
}
-(NSArray *)images_arr
{
    if(_images_arr==nil)
    {
        _images_arr=[NSArray arrayWithObjects:@"1.JPG",@"2.JPG", nil];
    }
    return _images_arr;
}
-(SegmentControllerView *)segmentV
{
    if(_segmentV==nil)
    {
        _segmentV=[[SegmentControllerView instance]initWithFrame:self.view.frame andImageList:self.images_arr];
    }
    return _segmentV;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
