//
//  NADetailViewController.m
//  NewsAggregator
//
//  Created by Labs on 10/16/13.
//  Copyright (c) 2013 TeraMoLabs. All rights reserved.
//

#import "NADetailViewController.h"

#define PUBLISH_DATE @"publish_date"
#define SOURCE @"source"
#define SOURCE_URL @"source_url"
#define SUMMARY @"summary"
#define TITLE @"title"
#define URL @"url"

@interface NADetailViewController ()

@end

@implementation NADetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = self.article[@"title"];
//    NSLog(@"%@",self.article[@"enclosures"][0][@"uri"]);
    
    if (self.article[@"enclosures"]) {
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.article[@"enclosures"][0][@"uri"]]]];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 65, image.size.width, image.size.height)];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    
    self.publishDateLabel.text = self.article[PUBLISH_DATE];
    self.sourceLabel.text = self.article[SOURCE];
    self.sourceURLLabel.text = self.article[SOURCE_URL];
    self.summaryLabel.text = self.article[SUMMARY];
    self.titleLabel.text = self.article[TITLE];
    self.URLLabel.text = self.article[URL];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
