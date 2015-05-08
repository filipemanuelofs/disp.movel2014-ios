//
//  ViewController.m
//  ExemploAula03
//
//  Created by Pedro Henrique on 07/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSString *texto;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.texto = @"Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.";
//    self.texto = @"outroTexto";

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self exemploRange];
//    [self exemploUserDafaults];
    [self verMeuTexto];
}

- (void) exemploRange {
    NSRange range = [self.texto rangeOfString:@"elitis"];
    NSLog(@"Range: location: %ul lengh: %ul", range.location, range.length);
}

- (void) exemploUserDafaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.texto forKey:@"meuTexto"];
    [defaults synchronize];
}

- (void) verMeuTexto {
    NSString *meuTexto = [[NSUserDefaults standardUserDefaults] objectForKey:@"meuTexto"];
    NSLog(@"Texto: %@", meuTexto);
}


- (void) literais {
    NSArray *array = [[NSArray alloc] initWithObjects:@"1", @"2", @"pedro", nil];
    array = @[@"pedro", @"2", @"iesb"];
    
    NSString *string = [[NSString alloc] initWithCString:"pedro" encoding:NSUTF8StringEncoding];
    string = @"pedro";
    
    NSNumber *numero = [[NSNumber alloc] initWithInt:2];
    numero = @2.333;

    NSDictionary *dict = [[NSDictionary alloc] initWithObjects:@[@1, @2, @3] forKeys:@[@"n1", @"n2",  @"n3"]];
    dict = @{@"numero1" : @1, @"numero2": @1, @"numero3" : @3};
    
    
}

- (void) plist {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Dados" ofType:@"plist"];
    NSDictionary *minhaPlist = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"Frase: %@", [minhaPlist objectForKey:@"Frase"]);
    
    NSMutableDictionary *plistMutabel = [minhaPlist mutableCopy];
    [plistMutabel setObject:@"Era uma vez" forKey:@"Frase2"];
    
    [plistMutabel writeToFile:path atomically:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
