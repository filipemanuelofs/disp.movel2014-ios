//
//  ViewDeTexto.m
//  ExemploAula05
//
//  Created by Pedro Henrique on 21/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "ViewDeTexto.h"

@implementation ViewDeTexto

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
    // Drawing code
    NSMutableAttributedString *iesb = [[NSMutableAttributedString alloc] initWithString:@"IESB"];
    [iesb addAttribute:NSFontAttributeName
                 value:[UIFont fontWithName:@"Helvetica" size:20]
                 range:NSMakeRange(0, 4)];
    
    [iesb addAttribute:NSForegroundColorAttributeName
                 value:[UIColor redColor]
                 range:NSMakeRange(0, 1)];
    
    [iesb drawAtPoint:CGPointMake(0, 0)];
}


@end
