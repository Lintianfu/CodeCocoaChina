//
//  PageControlViewController.m
//  CodeCocoaChina
//
//  Created by Mr.TF on 2020/2/17.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

#import "PageControlViewController.h"
#import "PageControllerView.h"
@interface PageControlViewController ()
@property(nonatomic,strong)PageControllerView *pageControlV;
@property(nonatomic,strong)NSArray *imageArr;
@end

@implementation PageControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PageControl");
    [self.view addSubview:self.pageControlV];
    // Do any additional setup after loading the view.
}
-(NSArray *)imageArr
{
    if(_imageArr==nil)
    {
        _imageArr=[NSArray arrayWithObjects:@"1.JPG",@"2.JPG",@"3.JPG",@"4.JPG",@"5.JPG", nil];
    }
    return _imageArr;
}
- (PageControllerView *)pageControlV
{
    if (!_pageControlV) {
        _pageControlV=[[PageControllerView instance]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andImageList:self.imageArr];
    }
    return _pageControlV;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
