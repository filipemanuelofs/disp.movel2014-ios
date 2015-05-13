//
//  TapViewController.m
//  ExemploGestos
//
//  Created by Pedro Henrique on 13/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewDeTeste;

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *toqueComUmDedo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onToqueComUmDedo:)];
    [self.viewDeTeste addGestureRecognizer:toqueComUmDedo];
    
    
    UITapGestureRecognizer *toqueComDoisDedos = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onToqueComDoisDedos:)];
   
    /*toque com dois dedos. Experimente mudar o número de dedos! 
     (no simulador, só conseguimos simular toques com dois dedos, porém no device podemos colocar mais) */
    [toqueComDoisDedos setNumberOfTouchesRequired:2];
    
    //quantidae de "cliques". Experimente descomentar esta linha!
//    [toqueComDoisDedos setNumberOfTapsRequired:2];
    [self.viewDeTeste addGestureRecognizer:toqueComDoisDedos];
}


- (void) onToqueComUmDedo: (UITapGestureRecognizer *) sender {
    CGFloat novaLargura = 100.0;
    if (self.viewDeTeste.frame.size.width == 100.0) {
        novaLargura = 200.0;
    }
    
    CGPoint centro = self.viewDeTeste.center;
    
    [self.viewDeTeste setFrame:CGRectMake(self.viewDeTeste.frame.origin.x, self.viewDeTeste.frame.origin.y, novaLargura, self.viewDeTeste.frame.size.height)];
    [self.viewDeTeste setCenter:centro];
    
}


- (void) onToqueComDoisDedos: (UITapGestureRecognizer *) sender {
    CGFloat novaDimensao = 100.0;
    if (self.viewDeTeste.frame.size.width == 100.0) {
        novaDimensao = 200.0;
    }
    
    CGPoint centro = self.viewDeTeste.center;
    
    [self.viewDeTeste setFrame:CGRectMake(self.viewDeTeste.frame.origin.x, self.viewDeTeste.frame.origin.y, novaDimensao, novaDimensao)];
    [self.viewDeTeste setCenter:centro];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
