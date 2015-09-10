//
//  ViewController.m
//  CollectionViewInsertData
//
//  Created by Nilesh Agrawal on 7/14/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *photoCollectionView;
-(void)showPopOver;
@property UITapGestureRecognizer *tapRecognizer;
@property NSInteger lastIndex;
@property NSMutableArray *dataSet;
@property UIImage *takenImage;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat photoCollectionViewCellWidth = self.photoCollectionView.bounds.size.width;
    [flowLayout setItemSize:CGSizeMake(photoCollectionViewCellWidth/2, self.photoCollectionView.bounds.size.height)];
    [_photoCollectionView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.minimumInteritemSpacing = 0.0f;
    flowLayout.minimumLineSpacing=0.0f;
    [_photoCollectionView setCollectionViewLayout:flowLayout];
    _photoCollectionView.delegate = self;
    _photoCollectionView.dataSource = self;
    _tapRecognizer = [[UITapGestureRecognizer alloc]
                      initWithTarget:self action:@selector(showPopOver)];
    [_tapRecognizer setNumberOfTouchesRequired:1];
    
    _lastIndex = 0;
    _dataSet = [[NSMutableArray alloc] initWithArray:@[[UIImage imageNamed:@"tap_photo"]]];
    _takenImage = [UIImage imageNamed:@"tap_photo"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == [self theLastRowIndexOfCollectionView]){
        NSLog(@"Detected");
    }
}

-(void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
}

-(NSInteger)theLastRowIndexOfCollectionView
{
    return _lastIndex;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _lastIndex+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    PhotoCollectionViewCell *photoCollectionViewCell =[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    photoCollectionViewCell.photo.image = _takenImage;
   
    if(indexPath.row == [self theLastRowIndexOfCollectionView]){
        [photoCollectionViewCell addGestureRecognizer:_tapRecognizer];
    }else{
        [photoCollectionViewCell removeGestureRecognizer:_tapRecognizer];
    }
    return photoCollectionViewCell;
}


-(void)updatePhotowithImageAtEnd:(UIImage *)image{
    [_dataSet replaceObjectAtIndex:(_dataSet.count-1) withObject:image];
}

-(void)addPhotoToDataSet:(UIImage *)image{
    [_dataSet addObject:image];
}


-(void)takePhoto{
    
}

-(void)PhotoTaken{
    
}

-(void)showPopOver{
    [self updatePhotowithImageAtEnd:_takenImage];
    [_photoCollectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:_lastIndex inSection:0]]];
     _lastIndex++;
    [self addPhotoToDataSet:[UIImage imageNamed:@"tap_photo"]];
    [_photoCollectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:_lastIndex inSection:0]]];
}

@end
