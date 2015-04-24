//
//  ViewController.m
//  ExemploAula01
//
//  Created by Pedro Henrique on 24/04/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "ViewController.h"
#import "Carta.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *botao;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clicouNoBotao:(UIButton *)sender {
    Carta *cartaUm = [[Carta alloc] init];
    Carta *cartaDois = [[Carta alloc] init];
    
    [cartaUm setConteudo:@"conteudoCartaUm"];
    [cartaDois setConteudo:@"conteudoCartaDois"];
    
    BOOL saoIguais = [cartaUm comparar:cartaDois];
    
    NSString *mensagem = saoIguais ? @"Cartas Iguais" : @"Cartas Diferentes";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Resultado"
                                                    message:mensagem
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
}

@end
