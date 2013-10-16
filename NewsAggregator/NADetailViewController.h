//
//  NADetailViewController.h
//  NewsAggregator
//
//  Created by Labs on 10/16/13.
//  Copyright (c) 2013 TeraMoLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NADetailViewController : UIViewController

@property (nonatomic, retain) NSDictionary *article;
@property (weak, nonatomic) IBOutlet UILabel *publishDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceURLLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *URLLabel;
@end
