//
//  DownloadScrollViewController.m
//  ExemploAula08
//
//  Created by Pedro Henrique on 18/06/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "DownloadScrollViewController.h"

@interface DownloadScrollViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation DownloadScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self fazerDownload];
}


- (void) fazerDownload {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mdemulher.abril.com.br/sites/mdemulher/files/core/rio-de-janeiro-aniversario-450-anos_1.jpg"]];
    NSURLSessionConfiguration *configurarion = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    
    NSOperationQueue *fila = nil;
    fila = [NSOperationQueue mainQueue];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configurarion
                                                          delegate:nil
                                                     delegateQueue:fila];
    
    NSURLSessionDownloadTask *downloadTask;
    downloadTask = [session downloadTaskWithRequest:request
                                  completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                      //Em qual thread isso executa?
                                      
                                      UIImage *imagem = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                                      
                                      UIImageView *imageView = [[UIImageView alloc] initWithImage:imagem];
                                      
                                      [self.scrollView setMaximumZoomScale:4];
                                      
                                      [self.scrollView setContentSize:imageView.frame.size];
                                      
                                      [self.scrollView addSubview:imageView];
                                      
                                      
                                  }];
    
    [downloadTask resume];
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
