//
//  TelaBrancaViewController.m
//  ExemploAula04
//
//  Created by Pedro Henrique on 14/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "TelaBrancaViewController.h"

@interface TelaBrancaViewController ()
@property (weak, nonatomic) IBOutlet UIView *QUADRADO;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *pan;

@end

@implementation TelaBrancaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.pan setMinimumNumberOfTouches:2];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)arrasto:(UIPanGestureRecognizer *)sender {
    CGPoint posicaoDoDedo = [sender locationInView:self.view];
    [self.QUADRADO setCenter:posicaoDoDedo];
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
