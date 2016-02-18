//
//  MCSongCatalogViewController.m
//  MusicClient
//
//  Created by Sergey Salnikov on 08.02.16.
//  Copyright © 2016 Sergey Salnikov. All rights reserved.
//

#import "MCSongCatalogViewController.h"
#import "MCSongCollectionViewCell.h"
#import "MCNetworkingManager.h"
#import "MCSong.h"


@interface MCSongCatalogViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *modelsSong;

@end

@implementation MCSongCatalogViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Каталог песен";
    [self setupCollectionView];
    [self createSongModels];
}

- (void)setupCollectionView
{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MCSongCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([MCSongCollectionViewCell class])];
    self.collectionView.backgroundColor = [UIColor whiteColor];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setMinimumInteritemSpacing:2.0];
    [flowLayout setMinimumLineSpacing:2.0];
    [self.collectionView setPagingEnabled:YES];
    [self.collectionView setCollectionViewLayout:flowLayout];
}

- (void)createSongModels
{
    self.modelsSong = [NSMutableArray new];
    
    [[MCNetworkingManager sharedInstance] createModelsSongJSON:^(NSArray *modelsSong) {
        
        [self.modelsSong addObjectsFromArray:modelsSong];
        [self.collectionView reloadData];
        
    } fail:^(NSError *error) {
        NSLog(@"Error with get models song form MCNetworkingManager!");
    }];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(200, 200);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.modelsSong.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MCSongCollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MCSongCollectionViewCell class]) forIndexPath:indexPath];
    
    MCSong *song = [MCSong new];
    song = [self.modelsSong objectAtIndex:indexPath.row];
    
    collectionViewCell.authorLabel.text = song.author;
    collectionViewCell.titleSongLabel.text = song.title;
    collectionViewCell.layer.borderWidth = 1.0;
    collectionViewCell.layer.borderColor = [UIColor blackColor].CGColor;

    return collectionViewCell;
}

@end
