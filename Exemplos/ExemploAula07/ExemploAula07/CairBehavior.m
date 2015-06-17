//
//  CairBehavior.m
//  ExemploAula07
//
//  Created by Pedro Henrique on 11/06/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "CairBehavior.h"

@interface CairBehavior ()

@property (strong, nonatomic, readonly) UIGravityBehavior *gravidade;
@property (strong, nonatomic, readonly) UICollisionBehavior *colisao;

@end

@implementation CairBehavior
@synthesize gravidade = _gravidade;
@synthesize colisao = _colisao;

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addChildBehavior:self.gravidade];
        [self addChildBehavior:self.colisao];
    }
    return self;
}

- (UIGravityBehavior *)gravidade {
    if (!_gravidade) {
        _gravidade = [[UIGravityBehavior alloc] init];
        [_gravidade setMagnitude:0.7];
    }
    return _gravidade;
}

- (UICollisionBehavior *)colisao {
    if (!_colisao) {
        _colisao = [[UICollisionBehavior alloc] init];
        [_colisao setTranslatesReferenceBoundsIntoBoundary:YES];
    }
    return _colisao;
}

- (void)addItem:(id <UIDynamicItem>)item {
    [self.gravidade addItem:item];
    [self.colisao addItem:item];
}

- (void)removeItem:(id <UIDynamicItem>)item {
    [self.gravidade removeItem:item];
    [self.colisao removeItem:item];
}


@end
