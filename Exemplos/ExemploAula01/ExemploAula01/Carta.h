//
//  Carta.h
//  ExemploAula01
//
//  Created by Pedro Henrique on 24/04/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carta : NSObject

@property (strong, nonatomic) NSString *conteudo;

- (BOOL) comparar: (Carta *) outraCarta;

@end
