//
//  NACategoriesTableViewController.h
//  NewsAggregator
//
//  Created by Labs on 10/17/13.
//  Copyright (c) 2013 TeraMoLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "NADetailViewController.h"

@interface NACategoriesTableViewController : UITableViewController

@property (nonatomic, retain) NSArray *jsonArray;
@property (nonatomic, retain) NSString *categoryID;
@property (nonatomic, retain) NSString *categoryName;

@end
