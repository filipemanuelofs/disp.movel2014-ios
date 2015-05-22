//
//  ViewClip.m
//  ExemploAula05
//
//  Created by Pedro Henrique on 22/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "ViewClip.h"

//Nesta classe há um exemplo de como desenhar usando mais de um método
@implementation ViewClip

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


- (void)drawRect:(CGRect)rect {
    //Para desenhar com mais de um método, vamos precisar da instância do contexto
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *retangulo = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:10];
    [[UIColor lightGrayColor] setFill];
    [[UIColor blackColor] setStroke];
    [retangulo fill];
    [retangulo setLineWidth:4.0];
    [retangulo stroke];
    
    //Esta chamada faz o próximo desenho aparecer dentro deste retângulo!
    [retangulo addClip];
    
    [self desenharCirculo:context];
}

//Este é um exemplo de como usar mais de um método para desenhar coisas!
//Nesse caso vamos precisar de usar o contexto...
- (void) desenharCirculo: (CGContextRef) context {
    //Esta chamada "salva" o estado do contexto (tudo que foi feito até então)
    CGContextSaveGState(context);
    
    //Agora vamos desenhar o nosso círculo
    [[UIColor redColor] setFill];
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 60, 60)];
    [oval fill];
    
    //Terminado o desenho, vamos "restaurar" o contexto
    CGContextRestoreGState(context);
}


@end
