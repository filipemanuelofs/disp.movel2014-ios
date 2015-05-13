//
//  PanViewController.m
//  ExemploGestos
//
//  Created by Pedro Henrique on 13/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewDeTeste;

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [self.viewDeTeste addGestureRecognizer:pan];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) onPan: (UIPanGestureRecognizer *) sender {
    CGPoint posicaoDoDedo = [sender locationInView:self.view];
    [self.viewDeTeste setCenter:posicaoDoDedo];
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
