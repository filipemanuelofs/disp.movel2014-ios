//
//  SwipeViewController.m
//  ExemploGestos
//
//  Created by Pedro Henrique on 13/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()
@property (weak, nonatomic) IBOutlet UIView *verde;
@property (weak, nonatomic) IBOutlet UIView *amarelo;
@property (weak, nonatomic) IBOutlet UIView *azul;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UISwipeGestureRecognizer *swipeDireitaVerde = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeDireita:)];
    [swipeDireitaVerde setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.verde addGestureRecognizer:swipeDireitaVerde];
    
    UISwipeGestureRecognizer *swipeEsquerdaVerde = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeEsquerda:)];
    [swipeEsquerdaVerde setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.verde addGestureRecognizer:swipeEsquerdaVerde];
    
    
    UISwipeGestureRecognizer *swipeDireitaAmarelo = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeDireita:)];
    [swipeDireitaAmarelo setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.amarelo addGestureRecognizer:swipeDireitaAmarelo];
    
    UISwipeGestureRecognizer *swipeEsquerdaAmarelo = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeEsquerda:)];
    [swipeEsquerdaAmarelo setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.amarelo addGestureRecognizer:swipeEsquerdaAmarelo];
    
    UISwipeGestureRecognizer *swipeDireitaAzul = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeDireita:)];
    [swipeDireitaAzul setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.azul addGestureRecognizer:swipeDireitaAzul];
    
    UISwipeGestureRecognizer *swipeEsquerdaAzul = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeEsquerda:)];
    [swipeEsquerdaAzul setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.azul addGestureRecognizer:swipeEsquerdaAzul];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onSwipeDireita: (UISwipeGestureRecognizer *) sender {
    CGRect boundsDaTela = [[UIScreen mainScreen] bounds];
    CGFloat offset = boundsDaTela.size.width - 50;
    [UIView animateWithDuration:0.5 animations:^{
        sender.view.frame = CGRectOffset(sender.view.frame, offset, 0);
    }];
}
- (void) onSwipeEsquerda: (UISwipeGestureRecognizer *) sender {
    CGRect boundsDaTela = [[UIScreen mainScreen] bounds];
    CGFloat offset = (boundsDaTela.size.width * -1) + 50;
    [UIView animateWithDuration:0.5 animations:^{
        sender.view.frame = CGRectOffset(sender.view.frame, offset, 0);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
