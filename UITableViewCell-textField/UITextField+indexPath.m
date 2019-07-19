//
//  UITextField+indexPath.m
//  huiTongTeacher
//
//  Created by HT178 on 2019/7/19.
//  Copyright © 2019 HuiTongJY. All rights reserved.
//

#import "UITextField+indexPath.h"
#import <objc/runtime.h>

@implementation UITextField (indexPath)

static char indexPathKey;
- (NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, &indexPathKey);
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, &indexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
