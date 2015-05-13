//
//  PinchViewController.m
//  ExemploGestos
//
//  Created by Pedro Henrique on 13/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewDeTeste;

@end

@implementation PinchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch:)];
    [self.viewDeTeste addGestureRecognizer:pinch];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) onPinch: (UIPinchGestureRecognizer *) sender {
    sender.view.transform = CGAffineTransformScale(sender.view.transform, sender.scale, sender.scale);
    sender.scale = 1.0; //experimente comentar esta linha
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
