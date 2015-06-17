//
//  CairBehavior.h
//  ExemploAula07
//
//  Created by Pedro Henrique on 11/06/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CairBehavior : UIDynamicBehavior
- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;
@end
