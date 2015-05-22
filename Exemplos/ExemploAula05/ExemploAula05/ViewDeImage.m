//
//  ViewDeImage.m
//  ExemploAula05
//
//  Created by Pedro Henrique on 21/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "ViewDeImage.h"

@implementation ViewDeImage

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configurarMinhaView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configurarMinhaView];
}

- (void) configurarMinhaView {
    [self setBackgroundColor:[UIColor whiteColor]];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIImage *mario = [UIImage imageNamed:@"mario"];
//    [mario drawAtPoint: CGPointMake(0, 0)];
    
    [mario drawInRect:rect];
}


@end
