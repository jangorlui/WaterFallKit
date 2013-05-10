//
//  UIButton+URL.m
//  WaterView
//
//  Created by mac on 5/10/13.
//  Copyright (c) 2013 akria.king. All rights reserved.
//

#import "UIButton+URL.h"

@implementation UIButton (URL)
- (void)setImageFromUrl:(NSString*)urlString
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setImage:img forState:UIControlStateNormal];
        });
    });
}
@end
