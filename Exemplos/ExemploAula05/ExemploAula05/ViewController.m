//
//  ViewController.m
//  ExemploAula05
//
//  Created by Pedro Henrique on 21/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "ViewController.h"
#import "MinhaView.h"
#import "ViewDeTexto.h"
#import "ViewDeImage.h"
#import "ViewClip.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    CGRect tamanhoDaTela = [[UIScreen mainScreen] bounds];
//    MinhaView *mv = [[MinhaView alloc] initWithFrame:CGRectMake(10, 10, 250, 250)];
//    [self.view addSubview:mv];
    
//    ViewDeTexto *vt = [[ViewDeTexto alloc] initWithFrame:CGRectMake(30, 30, 200, 200)];
//    [self.view addSubview:vt];
    
//    ViewDeImage *vi = [[ViewDeImage alloc] initWithFrame:CGRectMake(30, 30, 150, 150)];
//    [self.view addSubview:vi];
    
    ViewClip *clip = [[ViewClip alloc] initWithFrame:CGRectMake(30, 30, 250, 250)];
    [self.view addSubview:clip];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
