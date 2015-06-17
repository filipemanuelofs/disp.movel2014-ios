//
//  ViewController.m
//  ExemploAula07
//
//  Created by Pedro Henrique on 11/06/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "ViewController.h"
#import "CairBehavior.h"

@interface ViewController () <UIDynamicAnimatorDelegate>
@property (weak, nonatomic) IBOutlet UIView *tabuleiro;

@property (strong, nonatomic, readonly) UIDynamicAnimator *animator;
@property (strong, nonatomic, readonly) CairBehavior *cairBehavior;

@property (strong, nonatomic) NSMutableArray* quadrados;
@end

@implementation ViewController
@synthesize animator = _animator;
@synthesize cairBehavior = _cairBehavior;

static const CGSize TAMANHO_DO_QUADRADO = {40, 40};

- (void)viewDidLoad {
    [super viewDidLoad];
    self.quadrados = [NSMutableArray new];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIDynamicAnimator *)animator {
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.tabuleiro];
        [_animator setDelegate:self];
    }
    return _animator;
}

- (CairBehavior *)cairBehavior {
    if (!_cairBehavior) {
        _cairBehavior = [[CairBehavior alloc] init];
        [self.animator addBehavior:_cairBehavior];
    }
    return _cairBehavior;
}


- (IBAction)criarQuadrado:(UIButton *)sender {
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = TAMANHO_DO_QUADRADO;
    
    int x = (arc4random()%(int)self.tabuleiro.bounds.size.width) / TAMANHO_DO_QUADRADO.width;
    frame.origin.x = x * TAMANHO_DO_QUADRADO.width;
    
    UIView *quadrado = [[UIView alloc] initWithFrame:frame];
    [quadrado setBackgroundColor:[UIColor redColor]];
    
    [self.tabuleiro addSubview:quadrado];
    [self.cairBehavior addItem:quadrado];
    [self.quadrados addObject:quadrado];
}
- (IBAction)explodir:(UIButton *)sender {
    if ([self.quadrados count]) {
        for (UIView *q in self.quadrados) {
            [self.cairBehavior removeItem:q];
        }
        [UIView animateWithDuration:2.0
                         animations:^{
                             for (UIView *q in self.quadrados) {
                                 int x = (arc4random()%(int)(self.tabuleiro.bounds.size.width*5)) - (int)self.tabuleiro.bounds.size.width*2;
                                 int y = self.tabuleiro.bounds.size.height;
                                 q.center = CGPointMake(x, -y);
                             }
                         }
                         completion:^(BOOL finished) {
                             [self.quadrados makeObjectsPerformSelector:@selector(removeFromSuperview)];
                         }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
