//
//  Carta.m
//  ExemploAula01
//
//  Created by Pedro Henrique on 24/04/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "Carta.h"

@implementation Carta
@synthesize conteudo;

- (BOOL) comparar: (Carta *) outraCarta {
    return [self.conteudo isEqualToString:outraCarta.conteudo];
}

@end
