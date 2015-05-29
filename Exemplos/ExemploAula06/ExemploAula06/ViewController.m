//
//  ViewController.m
//  ExemploAula06
//
//  Created by Pedro Henrique on 28/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "ViewController.h"

typedef int (^BLOCO_QUE_FAZ_SOMA) (int a, int b);

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSString *minhaString;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.minhaString = @"Hello Blocks!";
    
    
    BLOCO_QUE_FAZ_SOMA b = ^(int a, int b) {
        return a+b;
    };
    b(1, 2);
    
    int (^somar) (int a, int b) = nil;
    __block int qtd = 0;
    
    
    somar = ^(int valorA, int valorB) {
        qtd++;
        return valorA+valorB;
    };
    
    for (int i=0; i<10; i++) {
        NSLog(@"A soma resulta em: %d", somar(i, 10));
    }
    NSLog(@"Quantidade de somas: %d", qtd);
    

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [UIView animateWithDuration:10 animations:^{
//        [self.label setCenter:CGPointMake(40, 30)];
//    }];
    
    void (^animarLabel) (void) = [self qualBloco];
    
//    [self executarBloco:animarLabel];
    
    
//    [UIView animateWithDuration:10
//                          delay:0
//                        options:UIViewAnimationOptionCurveLinear
//                     animations:[self qualBloco]
//                     completion:^(BOOL finished) {
//                         
//                     }];
    
    UILabel *labelIESB = [[UILabel alloc] initWithFrame:self.label.frame];
    [labelIESB setText:@"IESB"];
    [labelIESB setBackgroundColor:[UIColor redColor]];
    [labelIESB setTextColor:[UIColor whiteColor]];
    
    [UIView transitionFromView:self.label
                        toView:labelIESB
                      duration:10
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:^(BOOL finished) {
                        if (finished) {
                            NSLog(@"Transição terminou!");
                        }
                    }];
    
}

- (void (^) (void)) qualBloco {
    void (^animarLabel) (void) = ^{
        [self.label setCenter:CGPointMake(40, 30)];
    };
    return animarLabel;
}

- (void) executarBloco: (void(^)(void)) bloco {
    bloco();
}

- (int) somarNumeroA: (int) a comNumeroB: (int) b {
    return a+b;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    ViewController * __weak weakSelfk = self;
    
    void (^blocoComLeak)(void) = ^{
        self.minhaString = @"Hello IESB!";
    };
    void (^blocoSemLeak)(void) = ^{
        weakSelfk.minhaString = @"Hello IESB!";
    };
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
