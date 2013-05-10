//
//  ViewController.m
//  WaterFallKit
//
//  Created by mac on 5/10/13.
//  Copyright (c) 2013 AlvinLui. All rights reserved.
//

#define MAX_OFFSET 60
#import "ViewController.h"

@implementation ViewController
@synthesize aoView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
//初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.aoView = [[WaterView alloc]initWithData];
    self.aoView.delegate=self;
    [self.view addSubview:self.aoView];
    loadPage = 1;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"\n contentOffset:%@ contentSizeheight:%f--loadPage:%d",NSStringFromCGPoint(scrollView.contentOffset),scrollView.contentSize.height-self.view.frame.size.height,loadPage);
    
    if (scrollView.contentOffset.y>scrollView.contentSize.height-self.view.frame.size.height+MAX_OFFSET) {
        loadPage++;
        [self.aoView loadImageWithPage:loadPage];
    }else if(scrollView.contentOffset.y<-MAX_OFFSET){
        loadPage = 1;
        [self.aoView refreshView];
    }
}


@end

