//
//  MessView.m
//  WaterView
//
//  Created by akria.king on 13-4-10.
//  Copyright (c) 2013年 akria.king. All rights reserved.
//

#import "MessView.h"
#import "UIButton+URL.h"

#define WIDTH 320/3
@implementation MessView
@synthesize idelegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithData:(DataInfo *)data yPoint:(float) y{
   
    self.dataInfo = data;
    
    float imgW=data.width;//图片原宽度
    float imgH=data.height;//图片原高度
    float sImgW = WIDTH-4;//缩略图宽带
    float sImgH = sImgW*imgH/imgW;//缩略图高度
    self = [super initWithFrame:CGRectMake(0, y, WIDTH, sImgH+4)];
    if (self) {
        UIButton *imageBtn = [[UIButton alloc]initWithFrame:CGRectMake(2,2, sImgW, sImgH)];//初始化url图片按钮控件
        [imageBtn setImageFromUrl:data.url];//设置图片地质
     
        [imageBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:imageBtn];
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentRight;
        label.backgroundColor = [UIColor blackColor];
        label.alpha=0.8;
        label.text=data.title;
        
        CGSize constraintSize = CGSizeMake(480.0f, MAXFLOAT);
        CGSize labelSize = [label.text sizeWithFont:label.font constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
        label.frame = CGRectMake(WIDTH-labelSize.width-4, self.frame.size.height-24, labelSize.width, 20);
        
        label.textColor =[UIColor whiteColor];
        [self addSubview:label];
       
    }
    return self;
}

-(void)click{
    [self.idelegate click:self.dataInfo];
}
@end
