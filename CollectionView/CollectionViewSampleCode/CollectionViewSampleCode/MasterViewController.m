//
//  ViewController.m
//  CollectionViewSampleCode
//
//  Created by Nilesh Agrawal on 6/18/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import "MasterViewController.h"
#import "CollectionViewSampleCode-Swift.h"


@interface MasterViewController ()
@property PapersDataSource *papersDataSource;

@end

@implementation MasterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _papersDataSource = [[PapersDataSource alloc] init];
    
   /* //Adjust the width of the collection view.
    CGFloat width = CGRectGetWidth(self.collectionView.frame)/3;
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.itemSize = CGSizeMake(width,width);
    */
    self.collectionView.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width = (CGRectGetWidth(self.collectionView.frame))/3;
    [flowLayout setItemSize:CGSizeMake(width, width)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.minimumInteritemSpacing = 0.02f;
    [self.collectionView setCollectionViewLayout:flowLayout];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _papersDataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];

    return cell;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"MasterToDetail"]){
        NSIndexPath *indexPath = [self.collectionView indexPathsForSelectedItems].firstObject;
        if(indexPath){
            Paper *paper = [_papersDataSource paperForItemAtIndexPath:indexPath];
            if(paper){
                DetailViewController *detailViewController = segue.destinationViewController;
                detailViewController.paper = paper;
            }
        }
    }
}
@end
