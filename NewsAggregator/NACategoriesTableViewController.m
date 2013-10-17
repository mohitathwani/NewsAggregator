//
//  NACategoriesTableViewController.m
//  NewsAggregator
//
//  Created by Labs on 10/17/13.
//  Copyright (c) 2013 TeraMoLabs. All rights reserved.
//

#import "NACategoriesTableViewController.h"

@interface NACategoriesTableViewController ()

@end

@implementation NACategoriesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"Categories";
    self.navigationItem.rightBarButtonItem.title = @"";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.feedzilla.com/v1/categories.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.jsonArray = (NSArray *)responseObject;

        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        NSLog(@"Error: %@", error);
    }];
    
    if ([CLLocationManager locationServicesEnabled]) {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [locationManager startUpdatingLocation];
        [locationManager setDelegate:self];
        
        NSString *url = [NSString stringWithFormat:@"https://api.forecast.io/forecast/6a72eeee2b113ec392e9bd646130de14/%f,%f",locationManager.location.coordinate.latitude,locationManager.location.coordinate.longitude];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSDictionary *json = (NSDictionary *)responseObject;
            
            int tempMin = [json[@"daily"][@"data"][0][@"temperatureMin"] integerValue];
            int tempMax = [json[@"daily"][@"data"][0][@"temperatureMax"] integerValue];
            NSString *temp = [NSString stringWithFormat:@"%d ºC/ %d ºC", (tempMax-32)*5/9, (tempMin-32)*5/9];
            self.navigationItem.rightBarButtonItem.title = temp;
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.jsonArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CategoriesCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.jsonArray[indexPath.row][@"english_category_name"];
//    cell.detailTextLabel.text = self.jsonArray[indexPath.row][@"category_id"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UITableViewCell *selectedCell = (UITableViewCell *)sender;
    NSInteger selectedRow = [self.tableView indexPathForCell:selectedCell].row;
    self.categoryID = self.jsonArray[selectedRow][@"category_id"];
    self.categoryName = self.jsonArray[selectedRow][@"english_category_name"];
    NACategoryListTableViewController *dVC = [segue destinationViewController];
    [dVC setCategoryID:self.categoryID];
    [dVC setCategoryName:self.categoryName];
}


@end
