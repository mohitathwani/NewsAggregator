//
//  NACategoryListTableViewController.h
//  NewsAggregator
//
//  Created by Labs on 10/17/13.
//  Copyright (c) 2013 TeraMoLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "NADetailViewController.h"

@interface NACategoryListTableViewController : UITableViewController

@property (nonatomic, retain) NSDictionary *json;
@property (nonatomic, retain) NSMutableArray *articlesArray;
@property (nonatomic, retain) NSString *categoryID;
@property (nonatomic, retain) NSString *categoryName;
@end
