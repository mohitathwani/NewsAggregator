//
//  NATopNewsTableViewController.h
//  NewsAggregator
//
//  Created by Labs on 10/16/13.
//  Copyright (c) 2013 TeraMoLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AFNetworking.h"
#import "NADetailViewController.h"


@interface NATopNewsTableViewController : UITableViewController <CLLocationManagerDelegate>

@property (nonatomic, retain) NSDictionary *json;
@property (nonatomic, retain) NSMutableArray *articlesArray;
@end
