//
//  RotationViewController.m
//  ExemploGestos
//
//  Created by Pedro Henrique on 13/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewDeTeste;

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onRotation:)];
    [self.viewDeTeste addGestureRecognizer:rotation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) onRotation: (UIRotationGestureRecognizer *) sender {
    
    sender.view.transform = CGAffineTransformRotate(sender.view.transform, sender.rotation);
    sender.rotation = 0.0; //experimente comentar esta linha!
    
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
