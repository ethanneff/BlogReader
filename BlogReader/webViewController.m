//
//  webViewController.m
//  BlogReaderFromScratch
//
//  Created by Ethan Neff on 5/20/14.
//  Copyright (c) 2014 Ethan Neff. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()

@end

@implementation webViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.blogPostURL]; //request is a URL
    [self.webView loadRequest:urlRequest]; // set the view output to the request
}

@end
