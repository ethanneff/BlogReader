//
//  TableViewController.m
//  BlogReaderFromScratch
//
//  Created by Ethan Neff on 5/15/14.
//  Copyright (c) 2014 Ethan Neff. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"
#import "webViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

#pragma mark - Load View
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // instantiate the properties
    self.blogPosts = [[NSMutableArray alloc] init];
    
    // set variables to build the JSON Dictionary
    NSURL *url = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    NSError *error = nil;
    
    // make the JSON Dictionary
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:urlData options:0 error:&error]; // &error to the get object of the pointer
    
    // grab the 'posts' information from the JSON dictionary and put them into an array
    NSArray *blogPostArray = [dataDictionary objectForKey:@"posts"];
    
    //parse through the 'posts' array
    for (NSDictionary *blogPostDictionary in blogPostArray) {
        // create a new BlogPost class
        BlogPost *blogPost = [[BlogPost alloc] initWithTitle:[blogPostDictionary objectForKey:@"title"]];
        
        // set the class's properties
        blogPost.author = [blogPostDictionary objectForKey:@"author"];
        blogPost.thumbnail = [blogPostDictionary objectForKey:@"thumbnail"];
        blogPost.date = [blogPostDictionary objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[blogPostDictionary objectForKey:@"url"]];
        
        // add class object to this TableView Property
        [self.blogPosts addObject:blogPost];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Make the Row Section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

# pragma mark - Make the Row Limit
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.blogPosts count];
}

# pragma mark - Fill the Rows
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // grab the cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // grab blogpost class from the property
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    if ([blogPost.thumbnail isKindOfClass:[NSString class]]) { // if the thumbnail is a NSString instead of a NSNull
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
    } else {
        cell.imageView.image = [UIImage imageNamed:@"treehouse"];
    }

    
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", blogPost.author, [blogPost formattedDate]];
    
    return cell;
}

#pragma mark - Segue
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showBlogPost"]) {               // name of segue
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];  // set the property
        [segue.destinationViewController setBlogPostURL:blogPost.url];      //
    }
}

@end
