//
//  ViewController.h
//  WaterFallKit
//
//  Created by mac on 5/10/13.
//  Copyright (c) 2013 AlvinLui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterView.h"
@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    int loadPage;
}
@property(nonatomic,strong)WaterView *aoView;
@end
