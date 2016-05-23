//
//  webViewController.h
//  BlogReaderFromScratch
//
//  Created by Ethan Neff on 5/20/14.
//  Copyright (c) 2014 Ethan Neff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSURL *blogPostURL;

@end
