//
//  SearchTableViewController.m
//  SampleSearch
//
//  Created by Nilesh Agrawal on 7/2/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import "SearchTableViewController.h"

@interface SearchTableViewController ()<UISearchBarDelegate, UISearchResultsUpdating>
@property (strong, nonatomic) UISearchController *searchController;
@property (strong,nonatomic)NSMutableArray *fetchedArray;
@property (strong,nonatomic)NSMutableArray *sampleDataSource;

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 64.00;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    //
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //Search Results Controllers to display the search results in the currentView.
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    
    self.searchController.searchBar.delegate = self;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    [self.searchController.searchBar sizeToFit];

    //Initialise the fetched Array...
    self.fetchedArray = [NSMutableArray array];
    self.sampleDataSource = [@[@"Kitchen",@"Bathroom",@"Bedroom",@"Garden",@"Patio",@"Hallway",@"Garage"] mutableCopy];
    NSLog(@"Count for subviews = %ld",self.searchController.searchBar.subviews.count);
    self.searchController.searchBar.backgroundColor = [UIColor whiteColor];
    
    for(UIView *view in self.searchController.searchBar.subviews){
        for(UIView *subView in view.subviews){
            if([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]){
               // NSLog(@"view = %ld",view.subviews.count);
                NSLog(@"view description = %@",view.subviews.description);
                subView.layer.borderColor = [UIColor whiteColor].CGColor;
        
            }else if([subView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]){
                //NSLog(@"view = %ld",view.subviews.count);
                NSLog(@"view description = %@",view.subviews.description);
                subView.alpha = 0.2;
            }
        }
     
        //if ([view isKindOfClass:NSClassFromString(@"UITextField")]){
       /* NSLog(@"view = %ld",view.subviews.count);
        NSLog(@"view description = %@",view.subviews.description);
        *///}
//        view.layer.borderColor = [UIColor blackColor].CGColor;
         }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if(self.searchController.isActive){
        return 1;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(self.searchController.isActive){
        return self.fetchedArray.count;
    }
    return self.sampleDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if(self.searchController.isActive){
        cell.textLabel.text = self.fetchedArray[indexPath.row];
    }else{
        cell.textLabel.text = self.sampleDataSource[indexPath.row];
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


-(void)filterResultsfromData:(NSArray *)dataArray  forSearchText:(NSString *)searchText{
    [self.fetchedArray removeAllObjects];
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"self contains[c] %@",searchText];
    [self.fetchedArray addObjectsFromArray:[dataArray filteredArrayUsingPredicate:predicate]];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = searchController.searchBar.text;
    [self filterResultsfromData:self.sampleDataSource forSearchText:searchString];
    [self.tableView reloadData];
}



@end
