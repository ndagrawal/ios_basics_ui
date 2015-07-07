//
//  ViewController.m
//  ViewHierarchyDemo
//
//  Created by Nilesh Agrawal on 7/6/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import "ViewController.h"
#import "CameraButtonView.h"

@interface ViewController ()<UISearchBarDelegate,UITextFieldDelegate,CustomViewDelegate>{
    BOOL shouldBeginEditing;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource, *originalDataSource;
@property UISearchBar *searchBar;
@property CameraButtonView *cameraButtonView;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        shouldBeginEditing = YES;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view, typically from a nib.
    _searchBar = [UISearchBar new];
    _searchBar.delegate = self;
    //_searchBar.showsCancelButton = YES;
    _searchBar.backgroundColor = [UIColor blackColor];

    [_searchBar setFrame:CGRectMake(0, 0,self.navigationController.navigationBar.bounds.size.width-112, self.navigationController.navigationBar.bounds.size.height)];
    [self.navigationController.navigationBar addSubview:_searchBar];
    [self.navigationController.navigationBar bringSubviewToFront:_searchBar];
    self.navigationController.navigationBar.clipsToBounds = NO;
    
    _cameraButtonView = [[CameraButtonView alloc] init];
    _cameraButtonView.center = CGPointMake(self.navigationController.navigationBar.bounds.size.width-82, self.navigationController.navigationBar.bounds.size.height/2);
    _cameraButtonView.delegate =self;
    
    [self.navigationController.navigationBar addSubview:_cameraButtonView];
    [self.navigationController.navigationBar bringSubviewToFront:_cameraButtonView];
    self.navigationController.navigationBar.clipsToBounds = NO;
    
    for (UIView *view in _searchBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            NSLog(@"sfsfs");
            break;
        }
    }
    
    self.dataSource = [NSMutableArray arrayWithCapacity:30];
    for (NSUInteger i = 0; i < 30; ++i) {
        [self.dataSource addObject:[NSString stringWithFormat:@"cell %lud", i]];
    }
    self.originalDataSource = self.dataSource;
}

-(void)viewDidAppear:(BOOL)animated{
    
    UIView *subviews = [_searchBar.subviews lastObject];
    self.searchBar.tintColor = [UIColor whiteColor];
    UITextField *textView = (id)[subviews.subviews objectAtIndex:1];
    textView.backgroundColor = [UIColor grayColor];
    textView.textColor =[UIColor whiteColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"searchBar:textDidChange: isFirstResponder: %i", [self.searchBar isFirstResponder]);
    
    if ([searchText length] == 0) {
        [self performSelector:@selector(hideKeyboardWithSearchBar:) withObject:searchBar afterDelay:0];
    }
    if (![searchText length]) {
  //      self.dataSource = self.originalDataSource;
        [self.collectionView reloadData];
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    [self performSelector:@selector(searchBarCancelButtonClicked:) withObject:self.searchBar afterDelay: 0.1];
    return YES;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)bar {
    // reset the shouldBeginEditing BOOL ivar to YES, but first take its value and use it to return it from the method call
    BOOL boolToReturn = shouldBeginEditing;
    shouldBeginEditing = YES;
    return boolToReturn;
}

- (void)hideKeyboardWithSearchBar:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
#pragma mark - collection view 

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [(UILabel *)cell.contentView.subviews[0] setText:self.dataSource[indexPath.row]];
    return cell;
}

-(void)didButtonPressed{
    NSLog(@"Something is working finally");
}


@end
