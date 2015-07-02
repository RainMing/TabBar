//
//  FirstViewController.m
//  TabBar标签视图控制器
//
//  Created by lanouhn on 15/7/1.
//  Copyright (c) 2015年 main.m. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
   
    /******* Do any additional setup after loading the view.**********/
    
    //给导航条设置title
    self.navigationItem.title = @"First";
    //修改导航条上文字的颜色(只有在进入下一级页面是得 First 颜色)
    self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
//    [self.navigationController.navigationBar setTintColor:[UIColor cyanColor]];
    //设置当前页面的导航条标题的颜色及大小
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25], NSForegroundColorAttributeName:[UIColor cyanColor]}];
    /*
     //对title的字符串颜色进行修改
     self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    
     //对title的字符串大小进行修改
     self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:20.0]  };
    */
    
    
    
    //修改导航条的背景色
//    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor blueColor]];//效果不同
    
    //隐藏导航条
//    self.navigationController.navigationBarHidden = YES;
    //关闭导航条的毛玻璃效果(默认为YES开  )
//    self.navigationController.navigationBar.translucent = YES;
    
    
    /*
     给导航条设置背景图片
     图片尺寸不同，导航条的显示效果不同
     1.小于44.将图片拉伸显示在导航条上及状态条上
     2.等于44.只会在导航条上显示图片
     3.大于44小于64.将图片平铺显示在导航条以及状态栏上
     4.等于64.正好显示在导航条以及状态栏上
     */
    
    //给导航条设置背景图片 32030.png  32044.png  32050.png  32064.png
//    UIImage *image = [UIImage imageNamed:@"32064.png"];
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    /*
     UIBarMetricsDefault,
     UIBarMetricsCompact,
     UIBarMetricsDefaultPrompt
     UIBarMetricsCompactPrompt,
     
     UIBarMetricsLandscapePhone
     UIBarMetricsLandscapePhonePrompt
     */
    
    [self.navigationController.navigationBar setAlpha:1.0];
    
    //导航条的样式
    /*
     UIBarStyleDefault
     UIBarStyleBlack
     UIBarStyleBlackOpaque       / /弃用。使用UIBarStyleBlack
     UIBarStyleBlackTranslucent
     */
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    
    //设置导航条的titleView
    /*
     //该方法也可以用来设置导航条的title
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor grayColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor greenColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"新闻";
    self.navigationItem.titleView = titleLabel;
    */
  //******************  UISegmentedControl  ********************
    UISegmentedControl *segement = [[UISegmentedControl alloc]initWithItems:@[@"图标1",@"图标2",@"图标3"]];
    segement.frame = CGRectMake(0, 0, 100, 30);
    //UISegmentedControl的背景图片
//    [segement setBackgroundImage:[UIImage imageNamed:@"8F86F844.jpg"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    /*
//    [segement backgroundImageForState:<#(UIControlState)#> barMetrics:<#(UIBarMetrics)#>];
//    [segement  dividerImageForLeftSegmentState:<#(UIControlState)#> rightSegmentState:<#(UIControlState)#> barMetrics:<#(UIBarMetrics)#>];
    */
    
    self.navigationItem.titleView = segement;
    //显示Toolbar http://blog.csdn.net/totogo2010/article/details/7682641
    /*
    [self.navigationController  setToolbarHidden:NO animated:YES];
    UIBarButtonItem *one = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    UIBarButtonItem *two = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
    UIBarButtonItem *three = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
    UIBarButtonItem *four = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self setToolbarItems:[NSArray arrayWithObjects:flexItem, one, flexItem, two, flexItem, three, flexItem, four, flexItem, nil]];
    */
    
    //自定义导航条的leftBarButtonItem
    /*
     UIBarButtonSystemItemDone,
     UIBarButtonSystemItemCancel,
     UIBarButtonSystemItemEdit,
     UIBarButtonSystemItemSave,
     UIBarButtonSystemItemAdd,
     UIBarButtonSystemItemFlexibleSpace,
     UIBarButtonSystemItemFixedSpace,
     UIBarButtonSystemItemCompose,
     UIBarButtonSystemItemReply,
     UIBarButtonSystemItemAction,
     UIBarButtonSystemItemOrganize,
     UIBarButtonSystemItemBookmarks,
     UIBarButtonSystemItemSearch,
     UIBarButtonSystemItemRefresh,
     UIBarButtonSystemItemStop,
     UIBarButtonSystemItemCamera,
     UIBarButtonSystemItemTrash,
     UIBarButtonSystemItemPlay,
     UIBarButtonSystemItemPause,
     UIBarButtonSystemItemRewind,
     UIBarButtonSystemItemFastForward,
     */
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(leftItemAction:)];
    
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"左边" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction:)];
//    leftItem.title = @"left";
    
    //添加图片
    UIImage *imageleft = [UIImage imageNamed:@"left"];
    UIImageView *leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    leftImageView.image = imageleft;
    leftItem.customView = leftImageView;
    //打开用户交互
    leftImageView.userInteractionEnabled = YES;
    self.navigationItem.leftBarButtonItem = leftItem;
    //创建一个轻拍的手势添加到leftImageView上
    
    UITapGestureRecognizer *imageViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftItemAction:)];
    [leftImageView addGestureRecognizer:imageViewTap];
}


- (void)leftItemAction:(UIBarButtonItem *)sender
{
    
}

#pragma mark - view 的显示与消失
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"页面将要出现");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"页面Did出现");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"页面将要消失");
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"页面Did消失");
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
