//
//  FotosViewController.m
//  ExemploAula04
//
//  Created by Pedro Henrique on 14/05/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "FotosViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface FotosViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray *fotos;
@end

@implementation FotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
}

- (void) carregarBiblioteca {
    self.fotos = [[NSMutableArray alloc] init];
    ALAssetsLibrary *biblioteca = [[ALAssetsLibrary alloc] init];
    [biblioteca enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos
                              usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                                  [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                                      UIImage *thumb = [UIImage imageWithCGImage:result.thumbnail];
                                      if (thumb) {
                                          [self.fotos addObject:thumb];
                                          [self.collectionView reloadData];
                                      }
                                  }];
                              } failureBlock:^(NSError *error) {
                                  NSLog(@"Erro ao acessar biblioteca de fotos: %@", error);
                              }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self carregarBiblioteca];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.fotos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"celulaPadrao" forIndexPath:indexPath];
    if (cell) {
        UIImageView *iv = (UIImageView *) [cell viewWithTag:250];
        [iv setImage: [self.fotos objectAtIndex:indexPath.row]];
    }
    return cell;
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
