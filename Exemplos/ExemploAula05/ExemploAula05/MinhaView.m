//
//  MinhaView.m
//  ExemploAula05
//
//  Created by Pedro Henrique on 21/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "MinhaView.h"

@implementation MinhaView

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
    UIBezierPath *bezierPath = [UIBezierPath new];
    
    [bezierPath moveToPoint:CGPointMake(75, 10)];
    [bezierPath addLineToPoint:CGPointMake(160, 150)];
    [bezierPath addLineToPoint:CGPointMake(10, 150)];
    [bezierPath closePath];
    
    UIColor *minhaCor = [UIColor colorWithRed:31.0/255.0
                                        green:148.0/255.0
                                         blue:33.0/255.0
                                        alpha:1];
    
    UIColor *segundaCor = [UIColor magentaColor];
    
    [minhaCor setFill];
    [segundaCor setStroke];
    
    [bezierPath fill];
    [bezierPath stroke];
}


@end
