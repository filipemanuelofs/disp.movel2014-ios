//
//  HelloWorldViewController.m
//  ExemploAula02
//
//  Created by Pedro Henrique on 30/04/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "HelloWorldViewController.h"
#import "SegundaTelaViewController.h"

@interface HelloWorldViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *dadosDaTabela;
@end

@implementation HelloWorldViewController
@synthesize dadosDaTabela;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.dadosDaTabela = @[@"Dado 1", @"Dado 2", @"Dado 3", @"Dado 4"];
    self.dadosDaTabela = [NSArray arrayWithObjects:@"Dado 1", @"Dado 2", @"Dado 3", @"Dado 4", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dadosDaTabela count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"meuIdentificadorDeReutilizacao";
    UITableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!celula) {
        celula = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:identifier];
    }
    [celula setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    NSString *dado = [self.dadosDaTabela objectAtIndex:indexPath.row];
    [celula.textLabel setText:dado];
    return celula;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *dado = [self.dadosDaTabela objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"segueTabela" sender:dado];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"segueTabela"]) {
        if ([segue.destinationViewController isKindOfClass:[SegundaTelaViewController class]]) {
            SegundaTelaViewController *destino = (SegundaTelaViewController *) segue.destinationViewController;
            [destino setDado:sender];
        }
    }
}

@end
